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
                    <div class="col-12 col-md-8 col-lg-8">
                        <div class="Details_main_left">
                            <div class="Details_main_title">
                            <h3 class="_title3"> {{serviceDetails.title}} <span class="Details_main_title_span _color"><i class="fas fa-pen"></i> EDIT</span></h3>
                            </div>

                            <div class="Details_main_left_menu _dis_flex">
                                <div class="Details_main_left_menu_left _flex_space" v-if="serviceDetails.category" >
                                    <p class="Details_main_left_menu_date_text">
                                        Category > <span class="_color">{{serviceDetails.category.catName}}</span>
                                    </p>
                                </div> 

                                <div class="Details_main_left_menu_date">
                                    <p class="Details_main_left_menu_date_text">
                                        Modified date : <span class="_color">Jun 19, 2019</span>
                                    </p>
                                </div> 
                            </div>

                            <div class="Details_slider _b_color2 _padd_20">
                                <img class="Details_slider_img" :src="serviceDetails.image[0].imageUrl" title="" alt="">
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
                                        <button class="_bg _btn _block_buttons_btn" type="button">ORDER ({{serviceDetails.price}})</button>
                                        <button class="_btn2 _block_buttons_btn2" type="button"><i class="fas fa-heart"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>


                                <!--~~~~~~~ Comments ~~~~~~~-->
                        <div class="_comment">
                            <p class="_comment_title">REVIEWS <span class="_comment_title_span">(20)</span></p>

                            <div class="_commnet_all">
                                    <!-- items --> 
                                <div class="_commnet_main _b_color2 _dis_flex">
                                    <div class="_commnet_img">
                                        <img class="_commnet_img_pic" src="img/8b173a18a6247663320344b23bd2854c.jpg" alt="" title="">
                                    </div>

                                    <div class="_commnet_status_name _flex_space">
                                        <div class="_commnet_name _dis_flex">
                                            <div class="_commnet_name_title _flex_space">
                                                <p class="_commnet_pro_name">Sanit Marrine</p>
                                                <p class="_commnet_pro_date">June 20, 2019</p>
                                            </div>

                                            <ul class="_1job_card_rating_ul">
                                                <li class="_color"><i class="fas fa-star"></i></li>
                                                <li class="_color"><i class="fas fa-star"></i></li>
                                                <li class="_color"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                            </ul>
                                        </div>

                                        <div class="_commnet_status">
                                            <p class="_commnet_status_text"> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse</p>
                                        </div>
                                    </div>
                                </div>
                                    <!-- items -->

                                     <!-- items --> 
                                <div class="_commnet_main _b_color2 _dis_flex">
                                    <div class="_commnet_img">
                                        <img class="_commnet_img_pic" src="img/8b173a18a6247663320344b23bd2854c.jpg" alt="" title="">
                                    </div>

                                    <div class="_commnet_status_name _flex_space">
                                        <div class="_commnet_name _dis_flex">
                                            <div class="_commnet_name_title _flex_space">
                                                <p class="_commnet_pro_name">Sanit Marrine</p>
                                                <p class="_commnet_pro_date">June 20, 2019</p>
                                            </div>

                                            <ul class="_1job_card_rating_ul">
                                                <li class="_color"><i class="fas fa-star"></i></li>
                                                <li class="_color"><i class="fas fa-star"></i></li>
                                                <li class="_color"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                            </ul>
                                        </div>

                                        <div class="_commnet_status">
                                            <p class="_commnet_status_text"> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse</p>
                                        </div>
                                    </div>
                                </div>
                                    <!-- items -->

                                     <!-- items --> 
                                <div class="_commnet_main _b_color2 _dis_flex">
                                    <div class="_commnet_img">
                                        <img class="_commnet_img_pic" src="img/8b173a18a6247663320344b23bd2854c.jpg" alt="" title="">
                                    </div>

                                    <div class="_commnet_status_name _flex_space">
                                        <div class="_commnet_name _dis_flex">
                                            <div class="_commnet_name_title _flex_space">
                                                <p class="_commnet_pro_name">Sanit Marrine</p>
                                                <p class="_commnet_pro_date">June 20, 2019</p>
                                            </div>

                                            <ul class="_1job_card_rating_ul">
                                                <li class="_color"><i class="fas fa-star"></i></li>
                                                <li class="_color"><i class="fas fa-star"></i></li>
                                                <li class="_color"><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                                <li class=""><i class="fas fa-star"></i></li>
                                            </ul>
                                        </div>

                                        <div class="_commnet_status">
                                            <p class="_commnet_status_text"> tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse</p>
                                        </div>
                                    </div>
                                </div>
                                    <!-- items -->
                            </div>


                            <div class="_commnet_main_more _b_color2 _dis_flex">
                                <h2 class="_title4"><span class="_color _cursor">SEE MORE REVIEWS</span></h2>
                            </div>
                        </div>
                    </div>


                        <!--~~~~~~~ Details Main Right ~~~~~~~-->
                    <div class="col-12 col-md-4 col-lg-4 Details_main_rigth">
                                <!--~~~~~~~ Details Right Rating Extra ~~~~~~~-->
                        <div class="Details_pro _mr_b30 _box_shadow2 _border_radious">
                            <div class="Details_pro_rating _dis_flex align-items-center _padd_20">
                                <div class="_flex_space">
                                    <ul class="_1job_card_rating_ul">
                                        <li class="_color"><i class="fas fa-star"></i></li>
                                        <li class="_color"><i class="fas fa-star"></i></li>
                                        <li class="_color"><i class="fas fa-star"></i></li>
                                        <li class=""><i class="fas fa-star"></i></li>
                                        <li class=""><i class="fas fa-star"></i></li>
                                        <li class="_1job_card_rating_num">(2k+)</li>
                                    </ul>
                                </div>

                                <div class="_1job_card_dollar">
                                    <p class="_1job_card_dollar_text _color">  {{serviceDetails.price}}</p>
                                    <p class="_1job_card_dollar_sine _color">$</p>
                                </div>
                            </div>

                            <div class="_padd_20">
                                <div class="Details_pro_over _b_color2">
                                    <div class="Details_pro_renge _dis_flex ">
                                        <i class="fas fa-star"></i>

                                        <p class="Details_pro_renge_name _flex_space">Overrall rating</p>

                                        <p class="Details_pro_renge_num">3.2</p>
                                    </div>

                                    <div class="Details_pro_renge _dis_flex">
                                        <i class="fas fa-reply"></i>

                                        <p class="Details_pro_renge_name _flex_space">Reviws</p>

                                        <p class="Details_pro_renge_num">3.2</p>
                                    </div>

                                    <div class="Details_pro_renge _dis_flex">
                                        <i class="fas fa-shopping-cart"></i>

                                        <p class="Details_pro_renge_name _flex_space">Sales</p>

                                        <p class="Details_pro_renge_num">200</p>
                                    </div>
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
                                    
                                    <div class="Details_pro_button _b_color2">
                                        <div class="_block_buttons_main _dis_flex">
                                            <button class="_bg _btn _block_buttons_btn" @click="modalOn" type="button">ORDER NOW (${{totalOderPrice}})</button>
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

                                    <p class="Details_pro_renge_name _flex_space">Location</p>

                                    <p class="Details_pro_renge_num">USA</p>
                                </div>

                                <div class="Details_pro_renge _dis_flex none_f _b_color2">
                                    <i class="fas fa-globe-europe"></i>

                                    <p class="Details_pro_renge_name _flex_space">Labguages</p>

                                    <div class="Details_pro_renge_num">
                                        <p>English</p>
                                        <p>Spanish</p>
                                    </div>
                                </div>

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-exclamation-circle"></i>

                                    <p class="Details_pro_renge_name _flex_space">Boi</p>

                                    <div class="boi_text_div _w_100">
                                        <p class="boi_text">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                        consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse</p>
                                    </div>
                                </div>

                               <div class="Details_pro_renge Details_pro_renge2   _b_color2 _text_center">
                                    <p class="_contect_me _color_green"> Contact me <i class="fas fa-comments"></i></p>
                                </div>

                                <div class="Details_pro_renge Details_pro_renge3   _b_color2 _text_center">
                                    <p class="_contect_me _color">View my profile <i class="fas fa-user-alt"></i></p>
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
            width='600'
        >
                <div class="User_List">
                    <Row>
                        <Col span="12">
                                <DatePicker type="date" format="yyyy-MM-dd" v-model="selectBookingTime" @on-change="getSlots" placeholder="Select date" style="width: 200px"></DatePicker>
                        </Col>
                    </Row>
                    
                        <p class="list_title">Time List</p>
                        <table class="User_List_table" v-if="bookingTimeByDay.length" >
                            <tr>
                                <th>No</th>
                                <th>Time</th>
                                <th>Status</th>
                            </tr>
                            <tr v-for="(item,index) in bookingTimeByDay" :key="index" >
                                <td>{{index+1}}</td>
                                <td>{{item.bookingTime}}</td>
                                <td v-if="!item.isBooked"><button :class="(bookingTimeFalg===index)? 'table_button_green': 'table_button'" @click="assignDate(item.bookingTime,index)"  type="button">Click to Book</button></td>
                                <td v-if="item.isBooked" ><button class="table_button_red"  type="button">Booked</button></td>
                            </tr>
                        </table>
                    </div>
                    <div slot="footer">
                        <Button @click="bookingTimeModal = false">close</Button>
                        <Button @click="insertOrder">Order</Button>
                    </div>
                
        </Modal>
</div>
</template>

<script>
export default {
    data(){
        return{
            serviceDetails:{},
            order:{
                totalPrice:0,
                extraPrice:0,
                bookingTime:"",
                extraService:[],
                service_id: this.$route.params.id,
                seller_id:'',
            },
            bookingTimeModal:false,
            selectBookingTime : '',
            bookingTimeByDay : [],
            bookingTimeFalg : '',
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
            const res = await this.callApi('get',`getslots/${newDate}`)
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
            let newDate = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
            this.getBookingTimeByDay(newDate)
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
            let newDate = `${d.getFullYear()}-${monthNumber}-${dayNumber}`
            this.getBookingTimeByDay(newDate)
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
            this.order.extraPrice = (this.totalOderPrice-this.serviceDetails.price)
            this.order.extraService = JSON.stringify(this.order.extraService)
            const res = await this.callApi('post','insertOrder',this.order)
            if(res.status===201){
                this.s("Order Inserted Successfully!");
                this.bookingTimeModal = false
            }
            else{
                this.swr();
            }
        },
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
        this.getServiceDetails();
    },

}
</script>

<style>

</style>
