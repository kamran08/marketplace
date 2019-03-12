<template>
       <!--==========================
                        Profile
            ===========================-->
                <!--======= Profile Main ======-->
        <div class="profile_main">
            <div class="container">
                <div class="_title_header _b_color2">
                    <h3 class="_title">{{userInfo.name}} Profile</h3>
                </div>

                <p class="_title4"><i class="fas fa-chevron-left"></i> BACK</p>

                <div class="row">
                        <!--~~~~~~~ Profile Card ~~~~~~~-->
                    <div class="col-12 col-md-4 col-lg-4">
                        <!--~~~~~~~ Details Right Profile ~~~~~~~-->
                        <div class="Details_profie _mr_b30 _box_shadow2 _border_radious _padd_20">
                            <div class="Details_profie_img_div" v-if="authInfo.id==user_id" >
                                <Upload
                                 ref="upload"
                                 type="drag"
                                 name="img"
                                 :with-credentials="true"
                                 :headers="crfObj"
                                 :on-success="handleSuccess"
                                 :format="['jpg','jpeg','png']"
                                 :max-size="2048"
                                 action="/app/getUserImage">
                                 <!-- action="/app/uploadServiceImages"> -->
                                 <div  >
                                   <img class="Details_profie_img" :src="(userInfo.image==null)? defultImage: userInfo.image" title="" alt="">
                                    <p   class="Details_profie_img_edit">Upload Image</p>
                                 </div>
                              </Upload>
                                
                            </div>
                            <div class="Details_profie_img_div" v-if="authInfo.id!=user_id || authInfo == false" >
                                <div  >
                                   <img class="Details_profie_img" :src="(userInfo.image==null)? defultImage: userInfo.image" title="" alt="">
                                  
                                 </div>
                            </div>

                            <div class="Details_profie_title">
                                <h3 v-if="!isEdit" class="_title3">{{userInfo.name}} <span  v-if="authInfo.id==user_id" class="pro_edit_all" @click="isEdit=true" ><i class="fas fa-pencil-alt"></i> Edit</span></h3>
                                <p v-if="isEdit" class="_dis_flex align-items-center"><input  type="text" v-model="edituserInfo.name"> <span class="pro_edit_all" @click="updateInfo" > SAVE</span></p>
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

                                    <p v-if="!isEdit" class="Details_pro_renge_num">{{userInfo.location}}</p>
                                    <p v-if="isEdit" class="Details_pro_renge_num">
                                        <input type="text" v-model="edituserInfo.location">
                                    </p>
                                </div>

                                <div class="Details_pro_renge _dis_flex none_f _b_color2">
                                    <i class="fas fa-globe-europe"></i>

                                    <p class="Details_pro_renge_name _flex_space">Language</p>

                                    <div  class="Details_pro_renge_num">
                                        <select v-if="isEdit" v-model="edituserInfo.language" >
                                            <option value="volvo">English</option>
                                            <option value="saab">Spanish</option>
                                        </select>
                                        <p v-if="!isEdit" class="boi_text">{{userInfo.language}}</p>
                                    </div>
                                </div>

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-exclamation-circle"></i>

                                    <p class="Details_pro_renge_name _flex_space">Bio</p>

                                    <div  class="boi_text_div _w_100">
                                        <p v-if="isEdit" class="boi_text">
                                            <textarea rows="4" v-model="edituserInfo.bio"></textarea>
                                        </p>
                                        <p v-if="!isEdit" class="boi_text">{{userInfo.bio}}</p>
                                    </div>
                                </div>

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="far fa-money-bill-alt"></i>

                                    <p class="Details_pro_renge_name _flex_space">Payment info</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p v-if="isEdit" class="boi_text _text_overflow">
                                                <input type="text" v-model="edituserInfo.paymentInfo">
                                            </p>
                                            <p v-if="!isEdit" class="boi_text _text_overflow">{{userInfo.paymentInfo}}</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="far fa-money-bill-alt"></i>

                                    <p class="Details_pro_renge_name _flex_space">Billing info</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p v-if="isEdit" class="boi_text _text_overflow">
                                                <input type="text" v-model="edituserInfo.billingInfo">
                                            </p>
                                            <p  v-if="!isEdit" class="boi_text _text_overflow">{{userInfo.billingInfo}}</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="far fa-envelope"></i>

                                    <p class="Details_pro_renge_name _flex_space">Email</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p class="boi_text _text_overflow">{{userInfo.email}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-phone"></i>

                                    <p class="Details_pro_renge_name _flex_space">Contact Number</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p v-if="isEdit" class="boi_text _text_overflow">
                                                <input type="text" v-model="edituserInfo.phone">
                                            </p>
                                            <p v-if="!isEdit" class="boi_text _text_overflow">{{userInfo.phone}}</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="fas fa-home"></i>

                                    <p class="Details_pro_renge_name _flex_space">Country</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p v-if="isEdit" class="boi_text _text_overflow">
                                                <input type="text" v-model="edituserInfo.country">
                                            </p>
                                            <p  v-if="!isEdit" class="boi_text _text_overflow">{{userInfo.country}}</p>
                                        </div>
                                    </div>
                                </div>

                                </div>


                                <div class="Details_pro_renge Details_pro_renge2   _b_color2 _text_center">
                                    <p class="_contect_me _color_green"> Contact me <i class="fas fa-comments"></i></p>
                                </div>
                            </div>
                        </div>
                    
                        <!--~~~~~~~ Profile Card ~~~~~~~-->

                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                    <div class="col-12 col-md-8 col-lg-8">
                        <div class="_box_shadow2 pro_menu _border_radious ">
                            <ul class="pro_menu_list">
                                <li v-if="authInfo.id==user_id"  :class="(sellerTab==3)? 'pro_menu_active':''" @click="sellerTab=3">Bookings</li>
                                <li v-if="authInfo.id==user_id"  :class="(sellerTab==4)? 'pro_menu_active':''"  @click="sellerTab=4">Canceled Bookings</li>
                            </ul>
                        </div>
                        <bookinglist v-if="sellerTab==3 && authInfo.id==user_id " ></bookinglist>
                        <canclebookinglist v-if="sellerTab==4 && authInfo.id==user_id" ></canclebookinglist>
                    </div>
                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                </div>
            </div>
        </div>

</template>

<script>
import bookinglist from './bookinglist.vue'
import canclebookinglist from './canclebookinglist.vue'


        
export default {
    components:{
        bookinglist,
        canclebookinglist,
    },
    data(){
        return{
            sellerTab:3,
            user_id:this.$route.params.id,
            userInfo:[],
            edituserInfo:[],
            isEdit:false,
            defultImage:'/uploads/pcpSlKaSylqS3Vj2WUvtVmghh8KyPwERrbGGamVP.jpeg',
            crfObj: {
                    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
        }
    },
    methods:{
        async getProfileInfo(){
            const res = await this.callApi('get',`getProfileInfo/${this.user_id}`)
            if(res.status === 200){
                this.userInfo = res.data
                this.edituserInfo = res.data
            }
            else{
                this.swr();
            }
        },
        async updateInfo(){
            const res = await this.callApi('post','updateUserInfo',this.userInfo)
            if(res.status===200){
                this.s("You profile updated successfuly!");
                
                 this.userInfo =this.edituserInfo
                  this.isEdit =false
            }
            else{
                this.swr();
                 this.isEdit =false
            }
        },
        handleSuccess(res, file){

             this.userInfo.image = res;
            
        },

    },
    created(){
        this.getProfileInfo();
    }
}
</script>

<style>

</style>
