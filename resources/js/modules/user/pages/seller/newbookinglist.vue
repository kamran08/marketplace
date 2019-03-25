<template>
    <div>
        <div class="_profile_card_all" v-if="list.length && isloading" >
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
                            <button class="table_button" type="button" @click="updateStatus(1,index,item.buyer_id,item.seller_id)" >Approve</button>
                            <button class="table_button_red" type="button" @click="updateStatus(3,index,item.buyer_id,item.seller_id)">Cancle</button>
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
            <div span="14" align="center" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
                  <h2>Loading .....</h2>
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
            noti:{
                notifor:'',
                notifrom:'',
                notitxt:'',
                url:'',
                isloading:true
            }
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
        async updateStatus(status,index,buyer_id,seller_id){
            const res = await this.callApi('post',"updateStatus",{status:status,id:this.list[index].id})
            if(res.status==200){
                if(status==1){
                    this.noti.notitxt = 'user comlited your service'
                    this.noti.notifor = seller_id
                    this.noti.notifrom = buyer_id
                    this.noti.url = '/sprofile/'+seller_id+'?'+'tab=2'
                   // console.log(this.noti)
                    const res2 = await this.callApi('post','notifications', this.noti)
                    if(res2.status==200)
                    this.s("This booking has been approved!");
                    this.list[index].status = 1 
                }
                else if(status==3){
                    this.noti.notitxt = 'seller cancled your service'
                    this.noti.notifor = seller_id
                    this.noti.notifrom = buyer_id
                    this.noti.url = '/sprofile/'+seller_id+'?'+'tab=4'
                    const res2 = await this.callApi('post','notifications', this.noti)
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
