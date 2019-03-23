<template>
<div >
<div class="Details_header" v-if="serviceDetails" >
            <img class="Details_header_img" src="img/banner.png" alt="" title="">
        </div>
                <!--======= Details Header Image ======-->

                <!--======= Details Main ======-->
        <div class="Details_main">
            <div class="container">
                <div class="row">
                        <!--~~~~~~~ Details Main left ~~~~~~~-->
                    <div class="col-12 col-md-8 col-lg-8" >
                        <div class="Details_main_left">
                            <div class="Details_main_title">
                            <h3 class="_title3"> {{serviceDetails.title}} <span class="Details_main_title_span _color" v-if="authInfo.id==serviceDetails.user_id" ><i class="fas fa-pen"></i><router-link :to="{name:'editJobDescription' ,params:{id:serviceDetails.id}}">Edit</router-link></span></h3>
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
                                        <button class="_bg _btn _block_buttons_btn" type="button">Price {{serviceDetails.price}}$</button>
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


                            <!-- <div class="_commnet_main_more _b_color2 _dis_flex">
                                <h2 class="_title4"><span class="_color _cursor">SEE MORE REVIEWS</span></h2>
                            </div> -->
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
                                    <p class="_1job_card_dollar_sine _color">$</p>
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
                                                <p class="Details_pro_extra_ds _color">$</p>
                                            </div>
                                        </div>
                                    </template>
                                    
                                    <div class="Details_pro_button _b_color2" v-if="authInfo.userType==2"  >
                                        <div class="_block_buttons_main _dis_flex">
                                            <button class="_bg _btn _block_buttons_btn" @click="modalOn" type="button">ORDER NOW (${{totalOderPrice}})</button>
                                            <button class="_btn2 _block_buttons_btn2" type="button"><i class="fas fa-heart"></i></button>
                                        </div>
                                    </div>
                                    <div class="Details_pro_button _b_color2" v-if="authInfo.id == serviceDetails.user_id"  >
                                        <div class="_block_buttons_main _dis_flex">
                                            <button class="_bg _btn _block_buttons_btn" @click="modalOn" type="button">see the time slote</button>
                                            <button class="_btn2 _block_buttons_btn2" type="button"><i class="fas fa-heart"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                                <!--~~~~~~~ Details Right Profile ~~~~~~~-->
                        <div class="Details_profie _mr_b30 _box_shadow2 _border_radious _padd_20">
                            <img class="Details_profie_img" src="img/Rectangle40.png" title="" alt="">

                            <div class="Details_profie_title">
                                <h3 class="_title3">Husain Shipu</h3>
                                <div class="Details_profie_title_line"></div>
                            </div>

                            <div class="Details_profie_location">
                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-map-marker-alt"></i>

                                    <p class="Details_pro_renge_name _flex_space">Email</p>

                                    <p class="Details_pro_renge_num">{{serviceDetails.user.email}}</p>
                                </div>

                                <div class="Details_pro_renge _dis_flex none_f _b_color2">
                                    <i class="fas fa-globe-europe"></i>

                                    <p class="Details_pro_renge_name _flex_space">Phone</p>

                                    <div class="Details_pro_renge_num">
                                        <p>{{(serviceDetails.user.phone)? serviceDetails.user.phone : '---' }}</p>
                                        
                                    </div>
                                </div>

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-exclamation-circle"></i>

                                    <p class="Details_pro_renge_name _flex_space">Bio</p>

                                    <div class="boi_text_div _w_100">
                                        <p class="boi_text">{{serviceDetails.openingMassage}}</p>
                                    </div>
                                </div>

                               <div class="Details_pro_renge Details_pro_renge2   _b_color2 _text_center">
                                    <p class="_contect_me _color_green"> Contact me <i class="fas fa-comments"></i></p>
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
                 <div span="24" class="booked_date _text_center _box_shadow2">
                      <DatePicker :options="options3" type="date" format="yyyy-MM-dd" v-model="selectBookingTime" :value="selectBookingTime" @on-change="getSlots" placeholder="Select date" style="width: 220px"></DatePicker>
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
                    <h3>Service Not Avaiable This day</h3>
                </div>
                    
            </div>
            <div slot="footer" v-if="authInfo.userType!=1">
                    <Button @click="bookingTimeModal = false">Close</Button>
                    <Button @click="insertOrder">Order</Button>
            </div>
            <div slot="footer" v-if="authInfo.userType==1">
                    <Button @click="bookingTimeModal = false">Close</Button>
            </div>
        </Modal>
</div>
</template>
<script>
export default {
    data(){
        return{
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
        }
    },
    methods:{
        async  getServiceDetails(){
            const res = await this.callApi('get',`getServiceDetailsById/${this.$route.params.id}`) 
            if(res.status===200){
                this.serviceDetails = res.data;
            }
            else{
                this.swr();
            }
        },
        async  getBookingTimeByDay(newDate){
            let sdata = {
                date:newDate,
                service_id: this.order.service_id
            }
            const res = await this.callApi('post',`getslots`,sdata)
            if(res.status===200){
                this.bookingTimeByDay = res.data;
            }
            else{
                this.swr();
            }
        },
        bookingTime(){
            this.bookingTimeModal = true;
        },
        getSlots(){
            // FORMATE THE DATE 
            let d = new Date(this.selectBookingTime);
            let monthNumber = d.getMonth()+1
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
        modalOn(){
            let d = new Date();
            let monthNumber = d.getMonth()+1
            monthNumber = ("0" + monthNumber).slice(-2);
            let dayNumber = d.getDate()
            dayNumber = ("0" + dayNumber).slice(-2);
            this.selectBookingTime = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
            this.order.bookingDate = this.selectBookingTime 
            this.getBookingTimeByDay(this.selectBookingTime)
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
    },
   async created(){
       console.log(this.authInfo)
        this.getServiceDetails();
    },

}
</script>

<style>

</style>
