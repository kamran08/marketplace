<template>
<div >
    
        <div class="Details_header" v-if="serviceDetails && isloading" >
            <img class="Details_header_img" src="img/banner.png" alt="" title="">
        </div>
                <!--======= Details Header Image ======-->
        <div span="14" align="center" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
           <h2>Loading .....</h2>
        </div>
                <!--======= Details Main ======-->
        <div class="Details_main" v-if="isloading" >
            <div class="container">
                <div class="row">
                        <!--~~~~~~~ Details Main left ~~~~~~~-->
                    <div class="col-12 col-md-8 col-lg-8" >
                        <div class="Details_main_left">
                            <div class="Details_main_title">
                            <h3 class="_title3"> {{serviceDetails.title}} 
                                <span class="Details_main_title_span _color" v-if="authInfo.id==serviceDetails.user_id" >
                                    <i class="fas fa-pen"></i>
                                    <router-link :to="{name:'editJobDescription' ,params:{id:serviceDetails.id}}">Edit</router-link>
                                </span>

                                 <span class="Details_main_title_span _color" v-if="authInfo.id==serviceDetails.user_id" >
                                    <span class="color_coustom" @click="deleteService">Delete</span>
                                 </span>
                            </h3>
                            </div>

                            <div class="Details_main_left_menu _dis_flex">
                                <div class="Details_main_left_menu_left _flex_space" v-if="serviceDetails.category" >
                                    <p class="Details_main_left_menu_date_text">
                                        Category > <span class="_color">{{serviceDetails.category.catName}}</span>
                                    </p>
                                </div> 

                                <div class="Details_main_left_menu_date">
                                    <p class="Details_main_left_menu_date_text">
                                        <!-- Modified date : <span class="_color">Jun 19, 2019</span> -->
                                    </p>
                                </div> 
                            </div>

                            <div class="Details_slider _b_color2 _padd_20" v-if="serviceDetails.image.length">
                                <img class="Details_slider_img"  :src="serviceDetails.image[0].imageUrl" title="" alt="">
                            </div>

                            <div class="Details_block _b_color2 _padd_20">
                                <div class="Details_block_title">
                                    <h4 class="_title4">DESCRIPTION</h4>    
                                </div>

                                <div class="Details_block_status">
                                    <p class="Details_block_status_text">
                                         {{serviceDetails.description}}
                                    </p>

                                </div>
                                <div class="_tags">
                                    <ul class="_tags_ul">
                                        <li v-for="(item,index) in serviceDetails.tag" :key="index">{{item.tagName}}</li>
                                    </ul>
                                </div>

                                <div class="_block_buttons">
                                    <div class="_block_buttons_main _dis_flex">
                                        <button class="_bg _btn _block_buttons_btn" type="button">Price {{serviceDetails.price}}£</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                                <!--~~~~~~~ Comments ~~~~~~~-->
                        <div class="_comment">
                            <p class="_comment_title">REVIEWS <span class="_comment_title_span">({{serviceDetails.reviews_count}})</span></p> 

                            <div class="_commnet_all" v-if="serviceDetails.reviews_count!=0" >
                                    <!-- items --> 
                                <div class="_commnet_main _b_color2 _dis_flex" v-for="(item,index) in serviceDetails.reviews" :key="index"  v-if="serviceDetails.reviews.length">
                                    <div class="_commnet_img">
                                        <img class="_commnet_img_pic" :src="(item.user.image)? item.user.image : defultImage" alt="" title="">
                                    </div>

                                    <div class="_commnet_status_name _flex_space">
                                        <div class="_commnet_name _dis_flex">
                                            <div class="_commnet_name_title _flex_space">
                                                <p class="_commnet_pro_name">{{item.user.name}}</p>
                                                <p class="_commnet_pro_date">{{item.created_at}}</p>
                                            </div>

                                            <ul class="_1job_card_rating_ul">
                                                <li :class="(item.rating>=1)? '_color' : ''"><i class="fas fa-star"></i></li>
                                                <li :class="(item.rating>=2)? '_color' : ''"><i class="fas fa-star"></i></li>
                                                <li :class="(item.rating>=3)? '_color' : ''"><i class="fas fa-star"></i></li>
                                                <li :class="(item.rating>=4)? '_color' : ''"><i class="fas fa-star"></i></li>
                                                <li :class="(item.rating>=5)? '_color' : ''"><i class="fas fa-star"></i></li>
                                            </ul>
                                        </div>

                                        <div class="_commnet_status">
                                            <p class="_commnet_status_text"> {{item.comment}}</p>
                                        </div>
                                    </div>
                                </div>
                                    <!-- items -->
                            </div>
                        </div>
                    </div>
                        <!--~~~~~~~ Details Main Right ~~~~~~~-->
                    <div class="col-12 col-md-4 col-lg-4 Details_main_rigth">
                                <!--~~~~~~~ Details Right Rating Extra ~~~~~~~-->
                        <div class="Details_pro _mr_b30 _box_shadow2 _border_radious">
                            <div class="Details_pro_rating _dis_flex align-items-center _padd_20">
                                <div class=" _flex_space">
								<ul class="_1job_card_rating_ul" v-if="serviceDetails.avgreview" >
                                    <li :class="(serviceDetails.avgreview.averageRating>=1)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(serviceDetails.avgreview.averageRating>=2)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(serviceDetails.avgreview.averageRating>=3)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(serviceDetails.avgreview.averageRating>=4)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(serviceDetails.avgreview.averageRating>=5)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li class="_1job_card_rating_num">({{serviceDetails.reviews_count}})</li>
                                </ul>
								<ul class="_1job_card_rating_ul" v-if="serviceDetails.reviews_count==0" >
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li class=""><i class="fas fa-star"></i></li>
									<li class=""><i class="fas fa-star"></i></li>
									 <li class="_1job_card_rating_num">(0)</li>
								</ul>
							</div>

                                <div class="_1job_card_dollar  _text_right">
                                    <p class="_1job_card_dollar_text _color">  {{serviceDetails.price}}</p>
                                    <p class="_1job_card_dollar_sine _color">£</p>
                                </div>
                            </div>

                            <div class="_padd_20">
                                <div class="Details_pro_over _b_color2">
                                    <div class="Details_pro_renge _dis_flex ">
                                        <i class="fas fa-star"></i>

                                        <p class="Details_pro_renge_name _flex_space">Overrall rating</p>

                                        <p class="Details_pro_renge_num" v-if="serviceDetails.avgreview"> {{serviceDetails.avgreview.averageRating}}</p>
                                        <p class="Details_pro_renge_num" v-else> 0</p>
                                    </div>

                                    <div class="Details_pro_renge _dis_flex">
                                        <i class="fas fa-reply"></i>

                                        <p class="Details_pro_renge_name _flex_space">Total Review</p>

                                        <p class="Details_pro_renge_num">{{serviceDetails.reviews_count}}</p>
                                    </div>

                                    <!-- <div class="Details_pro_renge _dis_flex">
                                        <i class="fas fa-shopping-cart"></i>

                                        <p class="Details_pro_renge_name _flex_space">Sales</p>

                                        <p class="Details_pro_renge_num">200</p>
                                    </div> -->
                                </div>
                            </div>

                            

                            <div class="Details_pro_extra _padd_20">
                                <div class="Details_pro_extra_title">
                                    <h4 class="_title3">Extra</h4>
                                </div>
                                <div class="Details_pro_extra_all">
                                        <!-- items -->
                                    <template v-if="serviceDetails.extra">
                                        <div class="Details_pro_extra_main _b_color2 _dis_flex"  v-for="(item,index) in serviceDetails.extra" :key="index"  >
                                            <div class="Details_pro_extra_redio">
                                                <p>
                                                    <Checkbox v-model="item.staus" ></Checkbox>
                                                </p>
                                            </div>
                                            <div class="Details_pro_extra_status">
                                                <p class="Details_pro_extra_status_text _text_overflow2">{{item.serviceName}}</p>
                                            </div>
                                            <div class="Details_pro_extra_do">
                                                <p class="Details_pro_extra_do_text  _color">{{item.servicePrice}}</p>
                                                <p class="Details_pro_extra_ds _color">£</p>
                                            </div>
                                        </div>
                                    </template>
                                    
                                    <div class="Details_pro_button _b_color2" v-if="authInfo.userType==2"  >
                                        <div class="_block_buttons_main _dis_flex">
                                            <button class="_bg _btn _block_buttons_btn" @click="modalOn" type="button">Book an Appointment (£{{totalOderPrice}})</button>
                                            <button class="_btn2 _block_buttons_btn2" type="button"><i class="fas fa-heart"></i></button>
                                        </div>
                                    </div>
                                    <div class="Details_pro_button _b_color2" v-if="!authInfo"  >
                                        <div class="_block_buttons_main _dis_flex">
                                            <button class="_bg _btn _block_buttons_btn" @click="msgModal=true" type="button">Book an Appointment (£{{totalOderPrice}})</button>
                                            <button class="_btn2 _block_buttons_btn2" type="button"><i class="fas fa-heart"></i></button>
                                        </div>
                                    </div>
                                    <div class="Details_pro_button _b_color2" v-if="authInfo.id == serviceDetails.user_id"  >
                                        <div class="_block_buttons_main _dis_flex">
                                            <button class="_bg _btn _block_buttons_btn" @click="modalOn" type="button">See Your Time Slots.</button>
                                            <button class="_btn2 _block_buttons_btn2" type="button"><i class="fas fa-heart"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                                <!--~~~~~~~ Details Right Profile ~~~~~~~-->
                        <div class="Details_profie _mr_b30 _box_shadow2 _border_radious _padd_20">
                            <img class="Details_profie_img" :src="serviceDetails.user.image" title="" alt="">

                            <div class="Details_profie_title">
                                <h3 class="_title3">
                                    
                                    <router-link  :to="{name: 'sprofile' ,params:{id:serviceDetails.user.id}}" >{{serviceDetails.user.name}}</router-link>
                                    
                                
                                    </h3>
                                <div class="Details_profie_title_line"></div>
                            </div>

                            <div class="Details_profie_location">
                                 <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-map-marker-alt"></i>

                                    <p class="Details_pro_renge_name _flex_space">Email</p>
                                    <p class="Details_pro_renge_num" v-if="authInfo">{{serviceDetails.user.website}}</p>
                                    <p class="Details_pro_renge_num" v-if="!authInfo">{{(serviceDetails.user.website)?serviceDetails.user.website.substring(0,5)+"*****.com":""}}</p>
                                    <!-- <p class="Details_pro_renge_num">{{"****"+ serviceDetails.user.email.substring(serviceDetails.user.email.search('@')-3)}}</p> -->
                                </div>

                                <div class="Details_pro_renge _dis_flex none_f _b_color2">
                                    <i class="fas fa-globe-europe"></i>

                                    <p class="Details_pro_renge_name _flex_space">Phone</p>

                                    <div class="Details_pro_renge_num">
                                        <p v-if="authInfo">{{(serviceDetails.user.phone)? serviceDetails.user.phone : '' }}</p>
                                         <p v-if="!authInfo">{{(serviceDetails.user.phone)?serviceDetails.user.phone.substring(0,4) +"*******": '---' }}</p>
                                        
                                    </div>
                                </div>
                                <!-- social link -->
                                    <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-exclamation-circle"></i>

                                    <p class="Details_pro_renge_name _flex_space">Social Profile link: </p>

                                    <div  class="boi_text_div _w_100">
                                    
                                        <!-- <p v-if="!isEdit" class="boi_text">{{userInfo.bio}}</p> -->
                                        <div>
                                        <a :href="serviceDetails.user.facebook" :class="serviceDetails.user.facebook ? 'fb_link i':'fb_link_ i'"><i class="fab fa-facebook-square"></i></a>
                                        <a :href="serviceDetails.user.instagram" :class="serviceDetails.user.instagram ? 'inst_link i':'fb_link_ i'"><i class="fab fa-instagram"></i></a>
                                        <a :href="serviceDetails.user.twitter" :class="serviceDetails.user.twitter ? 'twt_link i':'fb_link_ i'"><i class="fab fa-twitter-square"></i></a>
                                        <a :href="serviceDetails.user.youTube" :class="serviceDetails.user.youTube ? 'yt_link i':'fb_link_ i'"><i class="fab fa-youtube"></i></a>
                                        <a :href="serviceDetails.user.google" :class="serviceDetails.user.google ? 'google_link i':'fb_link_ i'"><i class="fab fa-google-plus-square"></i></a>
                                        </div>
                                      
                                    </div>
                                </div>
                                <!-- end social link -->
                               <div class="Details_pro_renge Details_pro_renge2   _b_color2 _text_center" @click="msgModal = true"  >
                                    <p class="_contect_me _color_green"> Send Message <i class="fas fa-comments"></i></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <Modal
            v-model="bookingTimeModal"
            title="Select The Time"
            :closable = "false"
            width='700'
        >
            <div class="User_List">
                 <div span="24" class="booked_date _text_center">
                      <DatePicker :options="options3" type="date" format="yyyy-MM-dd" v-model="selectBookingTime" :value="selectBookingTime" @on-change="getSlots" placeholder="Select date" style="width: 220px"></DatePicker>
                </div>
                <h2 class="list_title" style="color:green">Available Days</h2>
                <div  v-if="hasday.length>0" class="day-selesct-all">
                        <p v-for="(item,i) in hasday" :key="i" :class="(item==currentday)?'day_select':'day_select_text'" @click="alaretmsg">{{item}}</p>
                </div>
                <div v-if="bookingTimeByDay.length">
                    <p class="list_title">SELECT FROM AVAILBLE TIME SLOTS</p>
                    <div class="User_List_table"  >
                        
                        <div class="_flex_row" >
                            <div class="User_List_table_main" v-for="(item,index) in bookingTimeByDay" :key="index" >
                                <div v-if="!item.isBooked">
                                    <button :class="(bookingTimeFalg===index)? 'table_button_green': 'table_button'" @click="assignDate(item.bookingTime,index)"  type="button">
                                        {{item.bookingTime}}
                                    </button>
                                </div>
                                <div v-if="item.isBooked">
                                    <button class="table_button_red line" type="button">
                                        {{item.bookingTime}}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div span="24" class="booked_date_order _text_center _box_shadow2" v-if="bookingTimeByDay.length==0" >
                    <h3>No time slots found for <span class="spe">{{getSelectedDate}}</span></h3>
                </div>
                    
            </div>
            <div slot="footer" v-if="authInfo.userType!=1">
                    <Button @click="bookingTimeModal = false">Close</Button>
                    <Button @click="insertOrder" v-if="authInfo">Order</Button>
            </div>
            <div slot="footer" v-if="authInfo.userType==1">
                    <Button @click="bookingTimeModal = false">Close</Button>
            </div>
        </Modal>
        <Modal
                v-model="msgModal"
                :title="(authInfo?'Write a message':'')"
                :closable = "false"
                width='500'
            >
            <div class="User_List">
                 <div v-if="authInfo">
                    <div class="form-group">
                        <p class=" msg_box_header">Your Message</p>
                        <textarea placeholder="Write your message..." class="form-control msg_box" v-model="msgData.msg" rows="3"></textarea>
                    </div>
                </div>
                 <div v-if="!authInfo">
                    <div class="form-group">
                        <router-link :to="{path: '/login?form=details/'+order.service_id}">Plase login</router-link>
                    </div>
                </div>
                    
            </div>
            
            <div slot="footer" >
                <Button type="warning"  @click="msgModal = false">Close</Button>
                <Button type="success" @click="sendMsg" v-if="authInfo">Send</Button>
            </div>
        </Modal>
       
</div>
</template>
<script>
export default {
    data(){
        return{
            isloading:true,
            serviceDetails:false,
            order:{
                totalPrice:0,
                extraPrice:0,
                bookingTime:"",
                bookingDate:"",
                extraService:[],
                service_id: this.$route.params.id,
                seller_id:'',
                
            },
            defultImage:'/img/prfile.png',
            bookingTimeModal:false,
            selectBookingTime : '',
            bookingTimeByDay : [],
            bookingTimeFalg : '',
            toDayDate:'',
            options3: {
                disabledDate (date) {
                    return date && date.valueOf() < Date.now() - 86400000;
                }
            },
            msgData:{
                msg: '',
                con_id: '',
                reciever:'',
                conType:null
            },
            msgModal : false,
            hasday:[],
            currentdate:'',
            currentday:''
        }
    },
    methods:{

        async deleteService(){
            console.log(this.$route.params.id)
            let data={
                'id': this.$route.params.id
            }
            const res = await this.callApi('post','deleteService', data)
            if(res.status===200){
                this.s('your service has been deleted')
                this.$router.push('/')
            }
          else this.swr()
        },
         alaretmsg(){
            alert('Please Select Date First!')
        },
         async sendMsg(){
            if(this.msgData.msg===''){
               return
            }
            // check if current buddy has any con_id or newly created one
            
            this.msgData.reciever=this.serviceDetails.user.id
            this.msgData.conType= 1
            const res = await this.callApi('post','insert-chat',this.msgData) 
            if(res.status===201){
                  this.msgData.msg=''
                  this.msgData.reciever=''
                  // update new chat 
                  this.s("Message has  been sent Successfully")
                  this.msgModal = false;
            }
            else{
                this.swr();
            }


         },
        async  getServiceDetails(){
            this.isloading = false
            const res = await this.callApi('get',`getServiceDetailsById/${this.$route.params.id}`) 
            if(res.status===200){
                this.serviceDetails = res.data;
                this.isloading = true
            }
            else{
                this.swr();
                this.isloading = true
            }
        },
        async  getBookingTimeByDay(newDate){
            let sdata = {
                date:newDate,
                service_id: this.order.service_id
            }
             this.isloading = false
            const res = await this.callApi('post',`getslots`,sdata)
            if(res.status===200){
                this.bookingTimeByDay = res.data;
                 this.isloading = true
            }
            else{
                this.swr();
                 this.isloading = true
            }
        },
        bookingTime(){
            this.bookingTimeModal = true;
        },
        getSlots(){
            // FORMATE THE DATE 
            let d = new Date(this.selectBookingTime);
            let monthNumber = d.getMonth()+1
            var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            this.currentday = days[d.getDay()]
            monthNumber = ("0" + monthNumber).slice(-2);
            let dayNumber = d.getDate()
            dayNumber = ("0" + dayNumber).slice(-2);
            this.selectBookingTime = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
            this.order.bookingDate = this.selectBookingTime 
            this.getBookingTimeByDay(this.selectBookingTime)
        },
        assignDate(slot,index){
            this.order.bookingTime = slot
            this.bookingTimeFalg = index
        },
        async imidiatebokingdate(){
            let id = this.$route.params.id
            let i,j
            const res = await this.callApi("get",`getday/${this.$route.params.id}`)
            if(res.status===200){
                for(i=0; i<res.data.length; i++){
                    this.hasday.push(res.data[i].day)
                }
                let tomorrow = new Date()
                let d = new Date()
                
                var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
                for(i = 0; i<7; i++){
                    var dayname = days[d.getDay()]
                //  console.log(dayname)
                for(j=0; j<this.hasday.length; j++){
                    if(dayname == this.hasday[j]){
                        this.currentdate = tomorrow
                        this.currentday = dayname
                        return
                    }
                 }
                    tomorrow.setDate(d.getDate()+1)
                    d = tomorrow;
            }
            return
         }
            
        },
        modalOn(){
            let d = new Date();
            // let ok = 
            console.log(this.currentdate)
            d = this.currentdate
            let monthNumber = d.getMonth()+1
            monthNumber = ("0" + monthNumber).slice(-2);
            let dayNumber = d.getDate()
            dayNumber = ("0" + dayNumber).slice(-2);
            this.selectBookingTime = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
            this.order.bookingDate = this.selectBookingTime 
            this.getBookingTimeByDay(this.selectBookingTime)


            
        
        //     let d = new Date()
        //     var days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
        // //  var dayName = days[d.getDay()];
     
        //    var tomorrow = new Date()
        //     let i
        //       for(i = 0; i<7; i++){
            
        //      var dayname = days[d.getDay()]
        //     // console.log(dayname)
        //     if(dayname == 'Thursday'){
        //         d = tomorrow
        //         break
        //     }
        //     else{
        //          tomorrow.setDate(d.getDate()+1)
        //           d = tomorrow;
        //     }
        //     }
        //      console.log(d)


            this.bookingTimeModal = true
            
        },

        async insertOrder(){
            if(this.order.bookingTime == ''){
                this.i("Please select a booking Time");
            }
            for(let item of this.serviceDetails.extra){
                if(item.staus==true){
                    this.order.extraService.push(item)
                }
            }
            this.order.seller_id = this.serviceDetails.user.id
            this.order.totalPrice = this.totalOderPrice
            this.order.extraPrice = (this.totalOderPrice-this.serviceDetails.price)
            this.order.extraService = JSON.stringify(this.order.extraService)
            const res = await this.callApi('post','insertOrder',this.order)
            if(res.status===201){
                this.s("Order Inserted Successfully!");
                this.clearOder(); 
                this.bookingTimeModal = false
            }
            else{
                this.swr();
            }
        },
        clearOder(){
                this.order.totalPrice = 0
                this.order.extraPrice = 0
                this.order.bookingTime = ""
                this.order.bookingDate = ""
                this.order.extraService = []
                this.order.seller_id = ''
        }

    },
    computed:{
        totalOderPrice(){
            let price = parseInt(this.serviceDetails.price)
            if(this.serviceDetails.extra){
                for(let item of this.serviceDetails.extra){
                    if(item.staus==true){
                        price+=parseInt(item.servicePrice);
                    }
                }
            }
            return price;
        },
        getSelectedDate(){
            let d = new Date(this.selectBookingTime);
            let monthNumber = d.getMonth()+1
            monthNumber = ("0" + monthNumber).slice(-2);
            let dayNumber = d.getDate()
            let weekDay = d.getDay()
            dayNumber = ("0" + dayNumber).slice(-2);
            let days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
            let monthNames = ["Jan", 'Feb', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', "Oct", "Nov", 'Dec']
            let year = d.getFullYear()
            let str = `${days[weekDay]} ${monthNames[monthNumber-1]}, ${year}`
            return str
            
        }
    },
   async created(){
       this.isloading = false
       console.log(this.authInfo)
        this.getServiceDetails();
        this.imidiatebokingdate()
       
    },
   
    

}
</script>

<style>
.color_coustom {
    color: red;
    padding: 0 0 0 12px;
}
</style>
