<template>
    <div >
        <div span="24" class="booked_date _text_center _box_shadow2">
            <DatePicker type="date"  @on-change="getSlots" placeholder="Select date"  :value="toDayDate" v-model="toDayDate" style="width: 220px;"></DatePicker>
        </div>
        <!-- card -->
        <div class="_profile_card_all tags_all" v-if="list.length && isloading"  >
            <div v-for="(item,index) in list" :key="index" >
                <div class="_profile_card _dis_flex _box_shadow2 _border_radious _mr_b30 "  v-if="item.status==2"  >
                    <div class="_profile_card_pic" v-if="item.service">
                        <img  class="_profile_card_img" :src="item.service.image[0].imageUrl" alt="" title="">
                    </div>
                    <div class="_profile_card_name _flex_space _dis_flex">
                        
                        <div class="_profile_card_title _flex_space" v-if="item.service">
                            <p class="_profile_card_name_text_link"><router-link :to="{ name:'details', params:{ id:item.service.id }}" >{{item.service.title}}</router-link></p> 
                        </div>
                        <div class="_profile_card_title _flex_space">
                            <p  class="_profile_card_name_text_link">Booked by: <router-link :to="{ name:'sprofile'}" >{{item.seller_info.name}}</router-link></p>
                            <p  class="_profile_card_name_text_link">Extra Service : {{(item.extraService.length)? "No ": "Yes"}}</p>
                        
                        </div>
                        <div class="_profile_card_title _flex_space">
                            <p class="_profile_card_name_text">Date: {{item.bookingDate}}</p> 
                        
                            <p class="_profile_card_name_text">Time: {{item.bookingTime}}</p> 
                        </div>
                        <div class="_profile_card_title _flex_space">
                            <button class="table_button" type="button" disabled>Completed</button>
                             <button v-if="item.review_count==0" class="table_button" @click="ReviewModalOn(item,index)" type="button" >Give Feedback about customer</button>
                        </div>
                        <div class="_dis_flex _profile_card_doller">
                            <div class="_1job_card_dollar">
                                <p class="_1job_card_dollar_text _color"> {{item.totalPrice}}</p>
                                <p class="_1job_card_dollar_sine _color">£</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div span="24" class="booked_date _text_center _box_shadow2" v-if="list.length==0 && isloading" >
            <h2>You are not compliting any service yet</h2>
        </div>
        <div span="14" align="center" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
           <h2>Loading .....</h2>
        </div>
        <Modal
            v-model="reviewModal"
            title="Please leave a rivew for this service"
            :closable = "false"
            width='600'
        >
            <div class="row  justify-content-center">
                <div class="col-md-12 text_center_custom">
                    <div class="_login_input_group">
                       <p class="_1steps_input_title" >How would you rate this Customer</p>
                       <div class="_login_input">
                          <div class="_login_input_inp">
                              <Rate v-model="reviewData.rating" />
                          </div>
                       </div>
                    </div>
                   
                </div>
                <div class="col-md-12">
                    <div class="_login_input_group">
                       <p class="_1steps_input_title" >Experiance with this Customer</p>
                       <div class="_login_input">
                          <div class="_login_input_inp">
                             <textarea class="_1steps_textarea" rows="4" cols="50" v-model="reviewData.comment"></textarea>
                          </div>
                       </div>
                    </div>
                </div>
            </div>

            <div slot="footer">
                <Button @click="reviewModal=false">Close</Button>
                <Button @click="SendReview">Send</Button>
            </div>
        </Modal>
        <!-- card -->
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            toDayDate:'',
            isloading:false,
             reviewModal:false,
                reviewData:{
                comment:'',
                rating:0,
                service_id:'',
                seller_id:'',
                booking_id:'',
                type:2
            },
            modalData:{},
            dataIndex:'',
        }
    },
    methods:{
        async getBookingListWithoutDate(){
            this.isloading = false
                let data = {
                status:2,
            }
            const res  = await  this.callApi('post',`getBookingListWithoutDate`,data);
            if(res.status===200){
                this.list = res.data
                this.isloading = true
            }
            else{
                this.swr();
            }
            this.isloading = true
        },
        ReviewModalOn(item,index){
            this.reviewModal = true;
            this.modalData = item
            this.dataIndex = index;
        },
        async getNewList(newDate){
            this.isloading = false
            let data = {
                date:newDate,
                status:2,
            }
            const res  = await  this.callApi('post',`getBookingList`,data);
            if(res.status===200){
                this.list = res.data
                console.log(this.list)
            }
            else{
                this.swr();
            }
            this.isloading = true
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
        },
        async SendReview(){
            if(this.reviewData.comment=='' || this.reviewData.rating=='' ){
                return;
            }

            this.reviewData.service_id = this.modalData.service_id
            this.reviewData.buyer_id = this.modalData.buyer_id
            this.reviewData.booking_id = this.modalData.id
            const res  = await  this.callApi('post',`giveReview`,this.reviewData);
            if(res.status===201){
                this.s("Thank you for your valuable feedback")
                this.list[this.dataIndex].review_count = 1;
                this.ClearRiviewTable();
                this.reviewModal = false;
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
                this.dataIndex = ''
        },
    },
    created(){
        // let d = new Date();
        // let monthNumber = d.getMonth()+1
        // monthNumber = ("0" + monthNumber).slice(-2);
        // let dayNumber = d.getDate()
        // dayNumber = ("0" + dayNumber).slice(-2);
        // this.toDayDate = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
        // this.getNewList(this.toDayDate);
        this.getBookingListWithoutDate();
    }
}
</script>

<style>

</style>
