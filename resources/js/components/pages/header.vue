<template>
	<div>
		<div class="_1menu _1flex">
				<div class="_1menu_logo" @click="$router.push('/')">
					<img class="_1menu_logo_pic" src="/img/logo.png" title="" alt="">
				</div>

				<div class="_1menu_search _1flex">
					<i class="fas fa-search"></i>
					<div class="_1menu_input _1flex_space">
						<input class="_1menu_input_int" placeholder="Search" type="text" name="fname">
					</div>
				</div>

				<div class="_1menu_sign _1flex_space">
					<div v-if="!this.authInfo">
						<ul class="_1menu_sign_ul">
							<li> <router-link :to="{ path: '/'}">Home</router-link></li>
							<li><router-link :to="{ path: '/marketplace'}">MARKETPLACE</router-link></li>
							<li><router-link :to="{ name: 'login'}"> Sign in </router-link></li>
							<li class="_1menu_sign_ul_or">or</li>
							<li><router-link :to="{ name: 'register'}">Join Us</router-link></li>
							
						</ul>
					</div>
				
				<div v-if="this.authInfo" >
						<ul class="_2menu_main_ul_list_ul">
							<li> <router-link :to="{ path: '/'}">HOME</router-link></li>
							<li v-if="authInfo.userType==1"> <router-link :to="{ path: '/jobDescription'}">POST SERVICE</router-link></li>
								<li><router-link :to="{ path: '/marketplace'}">MARKETPLACE</router-link></li>
							<!-- <li> <router-link :to="{ name: 'order'}">ORDER</router-link></li> -->
							<li v-if="authInfo.userType==1" > <router-link :to="{ name: 'sprofile', params: { id : authInfo.id}}">{{authInfo.name}}</router-link></li>
							<li v-if="authInfo.userType==2" > <router-link :to="{ name: 'bprofile', params: { id : authInfo.id}}">{{authInfo.name}}</router-link></li>
							<li v-if="authInfo.userType==4" class="uper"><a href="/system_admin">{{authInfo.name}}(Dashboard)</a></li>
							<li><a href="/logout" >LOGOUT</a></li>
							<li v-if="authInfo" >
									<div class="_2menu_mess" >
											<div @click="openNoti">
											<i class="fas fa-bell" ></i>
											<div class="_2menu_mess_num _bg" v-if="allnoti.length">{{allnoti.length}}</div>
											<div class="_2menu_mess_num _bg" v-if="!allnoti.length">0</div>
											</div>
											<div class="not_list" v-if="open">
												<div class="noti_all">
													<p class="noti_title">Notifications</p>

													<div class="noti_main_content"  >
															<!-- ITEMS -->
														<div class="noti_main" >
														<!-- /?	<img class="noti_img" src="/uploads/TR0fQprwrOD4tjEojSHPcdKUNNf6WgLEp3GB9pys.jpeg" alt="" title=""> -->

															<div class="noti_status" v-for="(item,index) in allnoti" :key="index">
															<a :href="item.url">	<p class="noti_status_text"><strong>{{item.user.name}}</strong> {{item.notitxt}} </p> </a>

																<p class="noti_status_time"><Icon type="md-chatboxes" /> 10mins</p>
															</div>
														</div>
															<!-- ITEMS -->

									
													</div>


													<p class="noti_more">
														See More
													</p>
												</div>
											</div>
									</div>
							</li>
							<li v-if="authInfo" >
									<div class="_2menu_mess ">
											<i class="fas fa-envelope"></i>
											<div class="_2menu_mess_num _bg">4</div>
									</div>
							</li>
							<li v-if="authInfo">
									<div class="_2menu_profile">
											<img class="_2menu_profile_pic" :src="(authInfo.image)? authInfo.image: defultImage" alt="" title="">
											<div class="_2menu_profile_on _2menu_profile_active"></div>
									</div>
							</li>
						</ul>
				</div>
				</div>

				<div class="moile_button _flex_space" @click="leftMain='0px'">
					<i class="fas fa-list-ul"></i>
				</div>

						<!--====== MOBILE MENU ==========-->
				 <div class="mobile_menu_content_all" :style="`left:${leftMain}`">
           <div class="mobile_menu_content">
                <div class="mobile_menu" :style="`left:${left}`">
                        <!-- frist page -->
                    <div class="mobile_menu_page">
                        <ul class="mobile_menu_frist_page_ul">
                            <li class="mobile_menu_frist_page_header" @click="left='-285px'">
                                <div class="mobile_menu_frist_page_ul_name_arrow" >
                                    <p class="mobile_menu_frist_page_ul_name">Categories</p>
                                    <p class="mobile_menu_frist_page_ul_arrow">></p>
                                </div>
                            </li>

              <li v-for="(item, index) in menuItems" :key="index" v-if="item.valid==authInfo.userType || item.valid=='all'"
															@click="goNextPage(item)"
														>{{item.name}}</li>
                            <li v-if="!authInfo">
                                <div class="mobile_menu_button">
                                    <button class="mobile_menu_button_sign" type="button" 	@click="notAuth('/register')">Sign Up</button>
                                    <button class="mobile_menu_button_log" type="button" 	@click="notAuth('/login')">Log In</button>
                                </div>
                            </li>
                            <li v-if="authInfo">
                                <div class="mobile_menu_button">
                                    <button class="mobile_menu_button_sign" type="button" 	@click="notAuth('/logout')">LOGOUT</button>
                                    
                                </div>
                            </li>
                        </ul>
                    </div>
                        <!-- frist page -->

                         <!-- 2nd page -->
                    <div class="mobile_menu_page">
                        <div class="mobile_menu_second_page_ul">
                            <div class="mobile_menu_frist_page_ul_name_arrow" @click="left='0px'">
                                <p class="mobile_menu_back"><i class="fas fa-chevron-left"></i></p>
                                <p class="mobile_menu_frist_page_ul_name">Menu</p>
                            </div>
                        </div>

                        <ul class="mobile_menu_frist_page_ul">
                            <!-- <li class="mobile_menu_frist_page_header">
                                <div class="mobile_menu_frist_page_ul_name_arrow tri_page">
                                    <p class="mobile_menu_frist_page_ul_name">Categories</p>
                                </div>
                            </li>
                            <li class="mobile_menu_frist_page_header">
                                <div class="mobile_menu_frist_page_ul_name_arrow tri_page">
                                    <p class="mobile_menu_frist_page_ul_name">Categories</p>
                                </div>
                            </li>
                             -->
                          <li v-for="(job,i) in alljobs" :key="i" @click="notAuth(`/marketplace?cat=${job.id}`)">{{job.catName}}</li>
                            
                        </ul>
                    </div>
                        <!-- 3rd page -->
                </div>
            </div>

								<!-- BACKGROUND -->
						<div class="bag_cencel" v-if="leftMain=='0px'" @click="leftMain='-100%'">
							<i class="fas fa-times"></i>
						</div>
								<!-- BACKGROUND -->
        </div>
						<!--====== MOBILE MENU ==========-->

			</div>

				<!--==========================
							Big Menu
				===========================-->
			<div class="_1big_menu" >
				<ul class="_1big_menu_ul">
					<li v-for="(job,i) in alljobs" :key="i" @click="$router.push(`/marketplace?cat=${job.id}`)">{{job.catName}}</li>
					<!-- this is for all catagory  --->
				</ul>
			</div>
	</div>
</template>
<script>
export default {
		data(){
			return{
				alljobs:[],
				allnoti:[],
				visible: false,
				defultImage:"/img/prfile.png",
				left: '0px',
				leftMain: '-100%',
				menuItems: [
					 {name: 'Home', url: '/', valid: 'all', id: false},
					 {name: 'Marketplace', url: '/marketplace', valid: 'all', id: false},
					 {name: 'Post service', url: '/jobDescription', valid: 1, id: false},
					 {name: 'Profile', url: '/sprofile', valid: 1, id: true},
					 {name: 'Profile', url: '/bprofile', valid: 2, id: true},
					 {name: 'Dashboard', url: '/system_admin', valid: 4, id: false},
					 
				],
				open:false
			}
	},
	
	async created(){
		const res = await this.callApi('get', 'get-all-catgory')
		if(res.status===200){
			this.alljobs = res.data;
			console.log('i am running')
		}
		else{
			this.swr();
		}
	   const res1 = await this.callApi('get',`getAllNotifications/${this.authInfo.id}`)
		if(res1.status===200){
			this.allnoti = res1.data;
			console.log(this.allnoti)
		}
		else{
			this.swr()
		}
	
	},
	methods:{
	  handleOpen () {
      if(this.visible==false)
      this.visible = true;
      else this.visible = false;
    },
    handleClose (id) {
			this.$store.dispatch('setUserType',id);
      this.visible = false;
		},
		goNextPage(item){
			 this.leftMain = '-100%'
			 if(item.name==='Dashboard'){
				  window.location = '/admin'
			 }
			 if(item.id){
				 	return this.$router.push(item.url+'/'+this.authInfo.id)
			 }
			 return this.$router.push(item.url)
		},
		notAuth(url){
			if(url=='/logout'){
				window.location = '/logout'
			}
			this.leftMain = '-100%'
			return this.$router.push(url)
		},
		openNoti(){
			if(this.open==true){
				this.open=false;
			}
			else this.open = true;
		}
	}
}
</script>



