<template>
    <div>
        <div class="_profile_card_all tags_all" v-if="list.length && isloading" >
            <!-- card -->
            <div v-for="(item,index) in list" :key="index" >
                <div class="_profile_card _dis_flex _box_shadow2 _border_radious _mr_b30 " v-if="item.status==0"  >
                    <div class="_profile_card_pic">
                        <img  class="_profile_card_img" :src="item.service.image[0].imageUrl" alt="" title="">
                    </div>
                    <div class="_profile_card_name _flex_space _dis_flex">
                        
                        <div class="_profile_card_title _flex_space">
                            <p class="_profile_card_name_text_link"><router-link :to="{ name:'details', params:{ id:item.service.id }}" >{{item.service.title}}</router-link></p> 
                        </div>
                        <div class="_profile_card_title _flex_space">
                            <p  class="_profile_card_name_text_link">Booked by: <router-link :to="{ name:'bprofile'}" >{{item.buyer_info.name}}</router-link></p>
                            <div  class="_profile_card_name_text_link">Extra Service : 
                                     <!-- <span class="job_tags_main" v-for="(ex, k) in item.extraService" :key="k">  {{ex.serviceName}} </span> -->
                                     <div class="job_tags"  v-for="(ex, k) in item.extraService" :key="k"> 
                                        <div class="job_tags_main">  {{ex.serviceName}}(${{ex.servicePrice}}) </div>
                                    </div>
                               
                            </div>
                        
                        </div>
                        <div class="_profile_card_title _flex_space">
                            <p class="_profile_card_name_text">Date: {{item.bookingDate}}</p> 
                        
                            <p class="_profile_card_name_text">Time: {{item.bookingTime}}</p> 
                        </div>
                        <div class="_profile_card_title _flex_space">
                            <button v-if="item.status==0" class="table_button" type="button" >Waiting For Approve</button>
                        </div>
                        <div class="_dis_flex _profile_card_doller">
                            <div class="_1job_card_dollar">
                                <p class="_1job_card_dollar_text _color"> {{item.totalPrice}}</p>
                                <p class="_1job_card_dollar_sine _color">$</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- card -->
        </div>
        <div span="24" class="booked_date _text_center _box_shadow2" v-if="list.length==0" >
                <h2>No New Bookings </h2>
        </div>
        <div span="14" align="center" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
           <h2>Loading .....</h2>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            isloading:true
        }
    },
    methods:{
        async getNewList(){
            this.isloading = false
            const res  = await  this.callApi('get','getNewList')
            if(res.status===200){
                this.list = res.data
            }
            else{
                this.swr();
            }
            this.isloading = true
        },
        async updateStatus(status,index){
            const res = await this.callApi('post',"updateStatus",{status:status,id:this.list[index].id})
            if(res.status==200){
                if(status==1){
                    this.s("This booking has been approved!");
                    this.list[index].status = 1 
                }
                else if(status==3){
                    this.i("This booking has been cancled!");
                    this.list[index].status = 3 
                }
            }
            else{
                this.e();
            }
        }
    },
    created(){
        this.getNewList();
    }
}
</script>

<style>

</style>
