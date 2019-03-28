 <template>
     <div>
           <!--==========================
                    MESSANGER
        ============================-->
    <div class="messanger">
        <div class="container_my">
            <div class="row">
                <div class="col-12 col-md-auto col-lg-auto mess-left-all sad">
                    <div class="mess-left">
                        <div class="mess_top_space"></div>
                        <div class="mess-left-one">
                            <p>Messanger</p>
                        </div>

                        <div class="mass_top_scrool flex-space">
                            <div class="mess-left-top b-color">
                                <div class="mess-right-input">
                                    <i class="fas fa-search"></i>
                                    <input  type="text" placeholder="Enter name">
                                </div>

                                <div class="mess-left-three">
                                    <div class="chatActive mess-left-three-one">
                                        <p class="chatActiveTxt">Inbox</p>
                                    </div>
                                </div>
                            </div>

                                <!--~~~~~~~ CHAT LIST ~~~~~~~~~-->
                            <div class="mass_name_list" v-if="chatListing.length" >
                                     <!-- ITEMS -->
                                <div class="mess-left-bottom " v-for="(item,index) in chatListing" :key="index" :class="(index==selectedIndex)? 'show_chat' : '' " @click="chatHistory(item,index)" >
                                    <div class="mess-left-bottom-main">
                                        <div class="mess-left-bottom-main-one">
                                            <div class="mess-left-bottom-main-one_before online"></div>
                                            <!----><img :src="item.image" alt="" title=""></div>
                                        <div class="mess-left-bottom-main-two">
                                            <div class="dis">
                                                <p class="mess_main_top_left_text_name">{{item.name}}</p>
                                                <div class="flex-space"></div>
                                                <!---->
                                            </div>
                                            <p class="mess-left-bottom-main-text  green-active">{{item.msg}}</p>
                                        </div>
                                    </div>
                                </div>
                                    <!-- ITEMS -->

                                    

                                   

                                 

                                    

                                     <!-- ITEMS -->
                                <div class="mess-left-bottom">
                                    <div class="mess-left-bottom-main">
                                        <div class="mess-left-bottom-main-one">
                                            <div class="mess-left-bottom-main-one_before online"></div>
                                            <!----><img src="img/pic.png" alt="" title=""></div>
                                        <div class="mess-left-bottom-main-two">
                                            <div class="dis">
                                                <p class="mess_main_top_left_text_name">TEST USER</p>
                                                <div class="flex-space"></div>
                                                <!---->
                                            </div>
                                            <p class="mess-left-bottom-main-text  green-active">TEST USER MESSAGES</p>
                                        </div>
                                    </div>
                                </div>
                                    <!-- ITEMS -->
                            </div>
                                <!--~~~~~~~ CHAT LIST ~~~~~~~~~-->
                        </div>
                    </div>
                </div>

                        <!--======= ALL MESSAGES AND NAME ==========-->
                <div class="col-12 col-md col-lg mass_center_all">
                    <div class="mess_center">
                        <div class="mess_center_all b-color">
                            <div class="mess_top_space"></div>
                            <div class="mess_main_top b-color dis">
                                <div class="mess_main_top_left dis">
                                    <div class="mess_main_top_left_pic">
                                        <div class="mess-left-bottom-main-one_before offlinec"></div>
                                        <img src="img/pic.png" alt="" title="" class="mess_main_top_left_pic_image">
                                    </div>

                                    <div class="mess_main_top_left_text">
                                        <p class="mess_main_top_left_text_name">{{currentBuddy.name}}</p>

                                        <p class="mess_main_top_left_text_off">
                                            Offline
                                            <span class="mess_main_top_left_text_off_sine offlinec"></span>
                                        </p>
                                    </div>
                                </div>
                                <div class="flex-space"></div>
                                <div class="mess_main_top_right">
                                    <ul class="mess_main_top_right_ul">
                                        <li><i class="ivu-icon ivu-icon-ios-call"></i></li>
                                        <li><i class="ivu-icon ivu-icon-md-videocam"></i></li>
                                        <li>
                                            <div class="ivu-dropdown">
                                                <div class="ivu-dropdown-rel">
                                                    <p href="javascript:void(0)"><i class="rotted_more ivu-icon ivu-icon-md-more"></i></p>
                                                </div>
                                                <div class="ivu-select-dropdown" style="display: none;">
                                                    <ul class="ivu-dropdown-menu">
                                                        <li class="ivu-dropdown-item">驴打滚</li>
                                                        <li class="ivu-dropdown-item">炸酱面</li>
                                                        <li class="ivu-dropdown-item">豆汁儿</li>
                                                        <li class="ivu-dropdown-item">冰糖葫芦</li>
                                                        <li class="ivu-dropdown-item">北京烤鸭</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>


                                    <!--~~~~~~~~~ ALL MESSAGES ~~~~~~~~~~~~~-->
                            <div class="mass-main-all" v-if="chats.length">
                                <div v-for="(item,index) in chats" :key="index">
                                     <!-- FRIEND MESSAGE -->
                                    <div class="friend-mass" v-if="item.msg_sender != authInfo.id" >
                                        <div class="friend-mass-one">
                                            <img :src="currentBuddy.image" alt="" title="">
                                        </div>

                                        <div class="friend-mass-two">
                                            <div class="friend-mass-two-main">
                                                <p>{{item.msg}}</p>
                                            </div>
                                        </div>

                                        <div class="delate_mass">
                                            <div class="ivu-dropdown">
                                                <div class="ivu-dropdown-rel">
                                                    <p href="javascript:void(0)"><i class="rotted_more ivu-icon ivu-icon-md-more"></i></p>
                                                </div>

                                                <div class="ivu-select-dropdown" style="display: none;">
                                                    <ul class="ivu-dropdown-menu">
                                                        <li class="ivu-dropdown-item">驴打滚</li>
                                                        <li class="ivu-dropdown-item">炸酱面</li>
                                                        <li class="ivu-dropdown-item">豆汁儿</li>
                                                        <li class="ivu-dropdown-item">冰糖葫芦</li>
                                                        <li class="ivu-dropdown-item">北京烤鸭</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="flex-space"></div>
                                    </div>
                                    <!-- FRIEND MESSAGE -->
                                    <!-- USER MESSAGE -->
                                    <div class="my-mass" v-if="item.msg_sender == authInfo.id">
                                        <div class="flex-space"></div>

                                        <div class="delate_mass">
                                            <div class="ivu-dropdown">
                                                <div class="ivu-dropdown-rel">
                                                    <p href="javascript:void(0)"><i class="rotted_more ivu-icon ivu-icon-md-more"></i></p>
                                                </div>
                                                <div class="ivu-select-dropdown" style="display: none;">
                                                    <ul class="ivu-dropdown-menu">
                                                        <li class="ivu-dropdown-item">驴打滚</li>
                                                        <li class="ivu-dropdown-item">炸酱面</li>
                                                        <li class="ivu-dropdown-item">豆汁儿</li>
                                                        <li class="ivu-dropdown-item">冰糖葫芦</li>
                                                        <li class="ivu-dropdown-item">北京烤鸭</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="friend-mass-two">
                                            <div class="my-mass-two-main">
                                                <p>{{item.msg}}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- USER MESSAGE -->
                                </div>
                            </div>

                                <!--~~~~~~~~~ TEXTAREA ~~~~~~~~-->
                            <div class="mass_main_texarea dis  b-color">
                                <div class="mass_main_texarea_all flex-space dis">
                                    <div class="mass_main_texarea_all_file"><i class="rottere_mass_main_texarea_all_file ivu-icon ivu-icon-md-attach"></i></div>
                                    <div class="mass_main_texarea_all_input flex-space">
                                        <textarea placeholder="Type a message" v-model="data.msg" rows="1"></textarea>
                                    </div>
                                    <!--<div class="mass_main_texarea_all_emojo">
                                        <i class="fas fa-recycle"></i>
                                    </div>-->
                                </div>

                                <div class="mass_main_texarea_button"  >
                                    <i class="fas fa-recycle" @click="sendMsg"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                        <!--~~~~~~~~ USER CARD ~~~~~~~~~~~~~-->
                <div class="col-12 col-md-auto col-lg-auto newfeed-right-all">
                        <!--~~~~~~~ Profile Card ~~~~~~~-->
                    <div class="Details_profie _mr_b30 _box_shadow2 _border_radious _padd_20">
                        <img class="Details_profie_img" :src="currentBuddy.image" title="" alt="">

                        <div class="Details_profie_title">
                            <h3 class="_title3">{{currentBuddy.name}}</h3>
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
                            <div class="Details_pro_renge _dis_flex b-color">
                                <i class="fas fa-map-marker-alt"></i>

                                <p class="Details_pro_renge_name _flex_space">Location</p>

                                <p class="Details_pro_renge_num">USA</p>
                            </div>

                            <div class="Details_pro_renge _dis_flex b-color">
                                <i class="far fa-money-bill-alt"></i>

                                <p class="Details_pro_renge_name _flex_space">Payment info</p>

                                <div class="boi_text_div _w_100">
                                    <div class="Pro_details">
                                        <p class="Pro_details_title">PayPal</p>
                                        <p class="boi_text _text_overflow">Jhon@gmail.com</p>
                                    </div>
                                </div>
                            </div>

                            <div class="Details_pro_renge _dis_flex b-color">
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
                        </div>
                    </div>
                        <!--~~~~~~~ Profile Card ~~~~~~~-->
                </div>
            </div>
        </div>
    </div>
        <!--==========================
                    MESSANGER
        ============================-->

     </div>
 </template>
 
 <script>
  import { mapGetters } from 'vuex'
 export default {
     data(){
         return{
              data: {
               msg: '',
               con_id: '',
               reciever:'',
               conType:null
            },
            selectedIndex:0,
            msgTab:1
         }
     },
     methods:{
         async getchatlisting(id){
             const res = await this.callApi('get',`get-chat-listing/${id}`)
             if(res.status ===200){
                  this.$store.dispatch('chatStoreIndex/setChatListing',res.data.lists)

                  if(res.data.lists.length){
                      this.$store.dispatch('chatStoreIndex/setCurrentBuddyInfo',res.data.lists[0])
                      this.$store.dispatch('chatStoreIndex/setChat',res.data.chats)
                  }
                  
             }
             else{
                 this.swr();
             }
         },

        ////////////////// chat history 

        async chatHistory(item, index){
            
            
            
             const ns = this.nl('Loading Conversations...')
            // UPDATE THE CURRENT BUDDY 
            this.$store.dispatch('chatStoreIndex/setCurrentBuddyInfo',this.chatListing[index])
            // remove all selected attribute 
            if(this.selectedIndex>=0){
                // remove from it 
                if(this.chatListing.length>1){
                    this.chatListing[this.selectedIndex].selected = false
                }
                
            }
            item.selected=true
            if(item.seen==1){
                console.log('decreasing...')
                this.$store.commit('msgNotiCount', -1)
            }
            item.seen=0
            this.selectedIndex = index;
            this.$store.dispatch('chatStoreIndex/setCurrentBuddy',index)
            const res = await this.callApi('get',`get-chat/${item.con_id}`)
            if(res.status === 200){
                
                this.$store.dispatch('chatStoreIndex/setChat', res.data.chats)
                this.updateSeen({con_id: this.currentBuddy.con_id})
                setTimeout(ns, 100); 
            }
            else{
                this.swr()
            }

        },
        ////////////////// End chat history 
        async sendMsg(){
            if(this.data.msg===''){
               return
            }
            // check if current buddy has any con_id or newly created one
            if(this.currentBuddy.con_id){
               this.data.con_id=this.currentBuddy.con_id
            }
            this.data.reciever=this.currentBuddy.uid
            this.data.conType=this.msgTab
            const res = await this.callApi('post','insert-chat',this.data) 
            if(res.status===201){
                  this.data.msg=''
                  // update new chat 
                  
                  let msgData = res.data 
                  msgData.msg = res.data.msg
                  msgData.index=this.selectedIndex
                  console.log(msgData)
                  this.$store.commit('chatStoreIndex/pushNewChat', msgData)
                  
            }
            else{
                this.swr();
            }


         },
        run(type){
           const obj = {
               con_id: this.currentBuddy.con_id,
               isTyping: true
           }
           this.sendWsInfo(1, obj)
           
           
        },
        stopped(type)
        {
           const obj = {
               con_id: this.currentBuddy.con_id,
               isTyping: false
           }
           this.sendWsInfo(1, obj)
        },
        sendWsInfo(type, value){
            // const ws = adonis.Ws()
            // ws.connect()
            // const chat = ws.subscribe(`noti:${this.currentBuddy[0].uid}`)

            // chat.on('ready', () => {
            //    const data = {
            //       type: type,
            //       input: value
            //    }
            //    chat.emit('message', data)
               

            // })
        },
        async deleteMsg(){
            const res = await this.callApi('post', 'delete-msg', {con_id: this.currentBuddy.con_id})
            if(res.status===200){
                this.ns('Message has been deleted successfully!')
                let index = this.chatListing.findIndex(c => c.con_id==this.currentBuddy.con_id)
                this.chatListing.splice(index,1)
            }else{
                this.swr()
            }
        },
        async updateSeen(updateData){
            const res = await this.callApi('post','update-seen',updateData)
            if(res.status!==200){
                this.swr();
            }
        }


    },
    computed: {
        ...mapGetters({
            chatListing: 'chatStoreIndex/getChatListing',
            currentBuddyIndex : 'chatStoreIndex/getCurrentBuddy',
            currentBuddy: 'chatStoreIndex/getCurrentBuddyInfo',
            chats: 'chatStoreIndex/getChat',
            isTyping :'chatStoreIndex/getIsTyping'
        }),

    },
     created(){
        this.getchatlisting(this.authInfo.id)
        this.msgNoficationData
     }
 }
 </script>
 
 <style>
 
 </style>
 