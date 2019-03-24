<template>
    <div >
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-12 padd_top">
                    <div span="24" class="booked_date _text_center _box_shadow2">
                        <DatePicker type="date"  @on-change="getSlots" placeholder="Select date"  :value="toDayDate" v-model="toDayDate" style="width: 220px;"></DatePicker>
                    </div>
                    <!-- card -->
                    <div class="_profile_card_all list_head _box_shadow2 _border_radious _overflow" v-if="list.length"  >
                        <table class="table_C table-striped">
                            <thead>
                            <tr>
                                <th>Title</th>
                                <th>Booked-by</th>
                                <th>Service-Provider</th>
                                <th>Extra</th>
                                <th>Date</th>
                                <th>Time</th>
                                <th>Total Price</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody >
                            <tr v-for="(item,index) in list" :key="index" v-if="item.status==1 "  >
                                <td>{{item.service.title}}</td>
                                <td>{{item.buyer_info.name}}</td>
                                <td>{{item.seller_info.name}}</td>
                                <td>{{item.extraService.length}}</td>
                                <td>{{item.bookingDate}}</td>
                                <td>{{item.bookingTime}}</td>
                                <td>{{item.totalPrice}}</td>
                                <td>
                                     <button class="table_button_green" type="button" @click="updateStatus(2,index)">Mark Complete</button>
                                        <button class="table_button_red" type="button" @click="updateStatus(3,index)">Cancle Booking</button>
                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- <div class="_profile_card_all _overflow" v-if="list.length"  >
                        <div v-for="(item,index) in list" :key="index" >
                            <div class="_profile_card _dis_flex _box_shadow2 _border_radious _mr_b30 " v-if="item.status==1 "  >
                                <div class="_profile_card_pic">
                                    <img  class="_profile_card_img" :src="item.service.image[0].imageUrl" alt="" title="">
                                </div>
                                <div class="_profile_card_name _flex_space _dis_flex">
                                    
                                    <div class="_profile_card_title _flex_space">
                                        <p class="_profile_card_name_text_link"><router-link :to="{ name:'details', params:{ id:item.service.id }}" >{{item.service.title}}</router-link></p> 
                                    </div>
                                    <div class="_profile_card_title _flex_space">
                                        <p  class="_profile_card_name_text_link">Booked by: <router-link :to="{ name:'bprofile'}" >{{item.buyer_info.name}}</router-link></p>
                                    
                                        <p  class="_profile_card_name_text_link">Extra Service : 
                                            asdasd
                                        </p>
                                    
                                    </div>
                                    <div class="_profile_card_title _flex_space">
                                        <p  class="_profile_card_name_text_link">Servicing by: <router-link :to="{ name:'bprofile'}" >{{item.seller_info.name}}</router-link></p>
                                    </div>
                                    <div class="_profile_card_title _flex_space">
                                        <p class="_profile_card_name_text">Date: {{item.bookingDate}}</p> 
                                    
                                        <p class="_profile_card_name_text">Time: {{item.bookingTime}}</p> 
                                    </div>
                                    <div class="_profile_card_title _flex_space">
                                        <button class="table_button_green" type="button" @click="updateStatus(2,index)">Mark Complete</button>
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
                    </div> -->
                    <div span="24" class="booked_date _text_center _border_radious _box_shadow2" v-if="list.length==0" >
                        <h2>No Bookings This Day</h2>
                    </div>
                    <!-- card -->
                </div>
            </div>
        </div>

    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            toDayDate:'',
            reviewModal:false,
            reviewData:{
                comment:'',
                rating:0,
                service_id:'',
                seller_id:'',
                booking_id:'',
            },
            modalData:{},
        }
    },
    methods:{
        async getNewList(newDate){
            let data = {
                date:newDate,
                status:1,
            }
            const res  = await  this.callApi('post',`getAllBookingList`,data);
            if(res.status===200){
                this.list = res.data
                console.log(this.list)
            }
            else{
                this.swr();
            }
        },

        ClearRiviewTable(){
                this.reviewData.comment=''
                this.reviewData.rating=0
                this.reviewData.service_id=''
                this.reviewData.seller_id=''
                this.reviewData.booking_id=''
                this.modalData = {}
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
                if(status==2){
                    this.i(" This booking has been marked completed!");
                    this.list[index].status = 2 
                    return;
                }
                this.i("This booking has been canceled!");
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
