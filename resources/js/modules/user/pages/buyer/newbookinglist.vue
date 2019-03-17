<template>
    <div>
        <div class="_profile_card_all" v-if="list.length" >
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
                            <p  class="_profile_card_name_text_link">Extra Service : {{(item.extraService.length)? "No ": "Yes"}}</p>
                        
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
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
        }
    },
    methods:{
        async getNewList(){
            const res  = await  this.callApi('get','getNewList')
            if(res.status===200){
                this.list = res.data
            }
            else{
                this.swr();
            }
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
