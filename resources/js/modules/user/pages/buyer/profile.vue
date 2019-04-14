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

                <!-- <p class="_title4"><i class="fas fa-chevron-left"></i> BACK</p> -->

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
                                <p v-if="isEdit" class="_dis_flex align-items-center "><input  type="text" v-model="edituserInfo.name"></p>
                                <div class="Details_profie_title_line"></div>
                            </div>

                            <div class="Details_profie_rating" v-if="userInfo.avgreview">
                                <ul class="_1job_card_rating_ul" v-if="userInfo.reviews_count!==0" >
                                    <li :class="(userInfo.avgreview.averageRating>=1)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(userInfo.avgreview.averageRating>=2)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(userInfo.avgreview.averageRating>=3)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(userInfo.avgreview.averageRating>=4)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(userInfo.avgreview.averageRating>=5)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li class="_1job_card_rating_num">({{userInfo.reviews_count}})</li>
                                </ul>
								<ul class="_1job_card_rating_ul" v-else  >
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li><i class="fas fa-star"></i></li>
									<li><i class="fas fa-star"></i></li>
									<li>(0)</li>
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

                                <!-- <div class="Details_pro_renge _dis_flex _b_color2">
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
                                </div> -->
<!-- 
                                <div class="Details_pro_renge _dis_flex _b_color2">
                                    <i class="far fa-envelope"></i>

                                    <p class="Details_pro_renge_name _flex_space">Email</p>

                                    <div class="boi_text_div _w_100">
                                        <div class="Pro_details">
                                            <p class="boi_text _text_overflow">{{userInfo.email}}</p>
                                        </div>
                                    </div>
                                </div> -->
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

                                        <!-- userInfo.id != authInfo.id condition replace by salman-->
                               <div class="Details_pro_renge Details_pro_renge2   _b_color2 _text_center" @click="msgModal = true" v-if="userInfo.userType==2">
                                    <p class="_contect_me _color_green"> Send Message <i class="fas fa-comments"></i></p>
                                </div>
                                
                                <div class="Details_pro_renge _dis_flex _b_color2 _text_center justify-content-center" v-if="isEdit"> 
                                    <p v-if="isEdit" class="_dis_flex align-items-center _text_center "> <span class="pro_edit_all_ff _btn _bg" @click="updateInfo" > SAVE</span></p>
                                </div>
                            </div>
                        </div>
                    
                        <!--~~~~~~~ Profile Card ~~~~~~~-->

                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                    <div class="col-12 col-md-8 col-lg-8" >
                        <div class="_box_shadow2 pro_menu _border_radious ">
                            <ul class="pro_menu_list">
                                <li :class="(sellerTab==6)? 'pro_menu_active':''" @click="sellerTab=6">Reviews</li>
                                <li v-if="authInfo.id==user_id" :class="(sellerTab==2)? 'pro_menu_active':''" @click="sellerTab=2">Awaiting approval</li>
                                <li v-if="authInfo.id==user_id"  :class="(sellerTab==3)? 'pro_menu_active':''" @click="sellerTab=3">Bookings</li>
                                <li v-if="authInfo.id==user_id"  :class="(sellerTab==4)? 'pro_menu_active':''" @click="sellerTab=4">Completed</li>
                                <li v-if="authInfo.id==user_id"  :class="(sellerTab==5)? 'pro_menu_active':''"  @click="sellerTab=5">Cancelled</li>
                                <li v-if="authInfo.id==user_id"  :class="(sellerTab==7)? 'pro_menu_active':''"  @click="sellerTab=7">Settings</li>
                            </ul>
                        </div>
                        <reviewList v-if="sellerTab==6" ></reviewList>
                        <newbookinglist v-if="sellerTab==2 && authInfo.id==user_id" ></newbookinglist>
                        <bookinglist v-if="sellerTab==3 && authInfo.id==user_id " ></bookinglist>
                        <completedList v-if="sellerTab==4 && authInfo.id==user_id " ></completedList>
                        <canclebookinglist v-if="sellerTab==5 && authInfo.id==user_id" ></canclebookinglist>
                        <settings v-if="sellerTab==7 && authInfo.id==user_id" ></settings>
                    </div>
                        <!--~~~~~~~ Profile Details ~~~~~~~-->
                </div>
            </div>
            <Modal
                v-model="msgModal"
                :title="userInfo.name"
                :closable = "false"
                width='500'
            >
            <div class="User_List">
                 <div>
                    <div class="form-group">
                        <p class=" msg_box_header">Your Message</p>
                        <textarea placeholder="Write your message..." class="form-control msg_box" v-model="msgData.msg" rows="3"></textarea>
                    </div>
                </div>
                    
            </div>
            
            <div slot="footer">
                <Button type="warning"  @click="msgModal = false">Close</Button>
                <Button type="success" @click="sendMsg">Send</Button>
            </div>
        </Modal>
        </div>

</template>

<script>
import bookinglist from './bookinglist.vue'
import canclebookinglist from './canclebookinglist.vue'
import newbookinglist from './newbookinglist.vue'
import completedList from './completedList.vue'
import reviewList from './reviewList.vue'
import settings from './settings.vue'


        
export default {
    components:{
        bookinglist,
        canclebookinglist,
        newbookinglist,
        completedList,
        reviewList,
        settings,
    },
    data(){
        return{
            sellerTab:6,
            user_id:this.$route.params.id,
            userInfo:[],
            edituserInfo:[],
            isEdit:false,
            defultImage:'/uploads/pcpSlKaSylqS3Vj2WUvtVmghh8KyPwERrbGGamVP.jpeg',
            crfObj: {
                    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            msgModal:false,
            msgData:{
                msg: '',
                con_id: '',
                reciever:'',
                conType:null
            }
        }
    },
    methods:{
        async getProfileInfo(){
            const res = await this.callApi('get',`getProfileInfo/${this.user_id}`)
            if(res.status === 200){
                this.userInfo = res.data
                console.log(this.userInfo)
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
        async sendMsg(){
            if(this.msgData.msg===''){
               return
            }
            // check if current buddy has any con_id or newly created one
            
            this.msgData.reciever=this.userInfo.id
            this.msgData.conType= 1
            const res = await this.callApi('post','insert-chat',this.msgData) 
            if(res.status===201){
                  this.msgData.msg=''
                  this.msgData.reciever=''
                  // update new chat 
                  this.s("Message has been sent Successfully")
                  this.msgModal = false;
            }
            else{
                this.swr();
            }


         },

    },
    created(){
          if(this.$route.query.tab>1 && this.$route.query.tab<7)
            this.sellerTab = this.$route.query.tab
            window.history.pushState(this.sellerTab, 'Title', '/bprofile/'+this.$route.params.id);
           
           this.getProfileInfo();
    }
}
</script>

<style>

</style>
