<template>
       <!--==========================
                        Profile
            ===========================-->
                <!--======= Profile Main ======-->
        <div class="profile_main">
            <div class="container">
                <div class="_title_header _b_color2">
                    <h3 class="_title">Jhon robart Profile</h3>
                </div>

                <p class="_title4"><i class="fas fa-chevron-left"></i> BACK</p>

                <div class="row">
                        <!--~~~~~~~ Profile Card ~~~~~~~-->
                    <div class="col-12 col-md-4 col-lg-4">
                        <!--~~~~~~~ Details Right Profile ~~~~~~~-->
                        <div class="Details_profie _mr_b30 _box_shadow2 _border_radious _padd_20">
                            <img class="Details_profie_img" src="img/Rectangle40.png" title="" alt="">

                            <div class="Details_profie_title">
                                <h3 class="_title3">Husain Shipu</h3>
                                <div class="Details_profie_title_line"></div>
                            </div>

                            <div class="Details_profie_rating">
                                <ul class="_1job_card_rating_ul">
                                    <li class="_color"><i class="fas fa-star"></i></li>
                                    <li class="_color"><i class="fas fa-star"></i></li>
                                    <li class="_color"><i class="fas fa-star"></i></li>
                                    <li class=""><i class="fas fa-star"></i></li>
                                    <li class=""><i class="fas fa-star"></i></li>
                                    <li class="_1job_card_rating_num">(2k+)</li>
                                </ul>
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

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="far fa-money-bill-alt"></i>

                                    <p class="Details_pro_renge_name _flex_space">Payment info</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p class="Pro_details_title">PayPal</p>
                                            <p class="boi_text _text_overflow">Jhon@gmail.com</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-home"></i>

                                    <p class="Details_pro_renge_name _flex_space">Billing info</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p class="Pro_details_title">Full name</p>
                                            <p class="boi_text _text_overflow">Jhon@gmail.com</p>
                                        </div>

                                        <div class="Pro_details">
                                            <p class="Pro_details_title">Address</p>
                                            <p class="boi_text _text_overflow">Sylhet, Bangladesh</p>
                                        </div>

                                        <div class="Pro_details">
                                            <p class="Pro_details_title">Country</p>
                                            <p class="boi_text _text_overflow">Bangladesh</p>
                                        </div>

                                        <div class="Pro_details">
                                            <p class="Pro_details_title">VAT number (BNG)</p>
                                            <p class="boi_text _text_overflow">Jhon@gmail.com</p>
                                        </div>
                                    </div>
                                </div>


                                <div class="Details_pro_renge Details_pro_renge2   _b_color2 _text_center">
                                    <p class="_contect_me _color_green"> Contact me <i class="fas fa-comments"></i></p>
                                </div>
                            </div>
                        </div>
                    </div>
                        <!--~~~~~~~ Profile Card ~~~~~~~-->

                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                    <div class="col-12 col-md-8 col-lg-8">
                        <div class="_box_shadow2 pro_menu _border_radious ">
                            <ul class="pro_menu_list">
                                <li :class="(sellerTab==1)? 'pro_menu_active':''" @click="sellerTab=1">Service</li>
                                <li :class="(sellerTab==2)? 'pro_menu_active':''" @click="sellerTab=2">New Bookings</li>
                                <li :class="(sellerTab==3)? 'pro_menu_active':''" @click="sellerTab=3">Bookings</li>
                                <li :class="(sellerTab==4)? 'pro_menu_active':''"  @click="sellerTab=4">Canceled Bookings</li>
                            </ul>
                        </div>
                        <servicelist v-if="sellerTab==1" ></servicelist>
                        <newbookinglist v-if="sellerTab==2" ></newbookinglist>
                        <bookinglist v-if="sellerTab==3" ></bookinglist>
                        <canclebookinglist v-if="sellerTab==4" ></canclebookinglist>
                    </div>
                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                </div>
            </div>
        </div>

</template>

<script>
import bookinglist from './bookinglist.vue'
import canclebookinglist from './canclebookinglist.vue'
import servicelist from './servicelist.vue'
import newbookinglist from './newbookinglist.vue'

        
export default {
    components:{
        bookinglist,
        canclebookinglist,
        servicelist,
        newbookinglist,
    },
    data(){
        return{
            sellerTab:2,
        }
    },
    methods:{

    }
}
</script>

<style>

</style>
