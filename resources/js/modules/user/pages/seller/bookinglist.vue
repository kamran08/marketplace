<template>
    <div >
        <div span="24" class="booked_date _text_center _box_shadow2">
            <DatePicker type="date"  @on-change="getSlots" placeholder="Select date"  :value="toDayDate" v-model="toDayDate" style="width: 220px;"></DatePicker>
        </div>
        <!-- card -->
        <div class="_profile_card_all" v-if="list.length"  >
            <div v-for="(item,index) in list" :key="index" >
                <div class="_profile_card _dis_flex _box_shadow2 _border_radious _mr_b30 "  v-if="item.status==1"  >
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
                            <button class="table_button_red" type="button" @click="updateStatus(3,index)">Cancle Booking</button>
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
        </div>
        <div span="24" class="booked_date _text_center _box_shadow2" v-if="list.length==0" >
            <h2>No Bookings This Day</h2>
        </div>
        <!-- card -->
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            toDayDate:''
        }
    },
    methods:{
        async getNewList(newDate){
            const res  = await  this.callApi('get',`getBookingList/${newDate}`)
            if(res.status===200){
                this.list = res.data
                console.log(this.list)
            }
            else{
                this.swr();
            }
        },
        getSlots(){
            // FORMATE THE DATE 
            let d = new Date(this.toDayDate);
            let monthNumber = d.getMonth()+1
            monthNumber = ("0" + monthNumber).slice(-2);

            let dayNumber = d.getDate()
            dayNumber = ("0" + dayNumber).slice(-2);
            this.toDayDate = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
            this.getNewList(this.toDayDate)
        },
        async updateStatus(status,index){
            const res = await this.callApi('post',"updateStatus",{status:status,id:this.list[index].id})
            if(res.status==200){
                this.i("This booking has been cancled!");
                this.list[index].status = 3 
                
            }
            else{
                this.e();
            }
        }
    },
    created(){
        let d = new Date();
        let monthNumber = d.getMonth()+1
        monthNumber = ("0" + monthNumber).slice(-2);
        let dayNumber = d.getDate()
        dayNumber = ("0" + dayNumber).slice(-2);
        this.toDayDate = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
        this.getNewList(this.toDayDate);
    }
}
</script>

<style>

</style>
