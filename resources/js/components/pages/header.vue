<template>
	<div>
		<div class="_1menu _1flex">
				<div class="_1menu_logo">
					<img class="_1menu_logo_pic" src="img/logo.png" title="" alt="">
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
							<li><a href="job_browse.html" title="">Job Brower</a></li>
							<li><router-link :to="{ name: 'login'}"> Sign in </router-link></li>
							<li class="_1menu_sign_ul_or">or</li>
							<li class="_1menu_sign_color">
										<Dropdown placement="bottom-end" trigger="custom" :visible="visible" style="margin-left: 20px margn-right:20px">
	        	  	    <a href="javascript:void(0)" @click="handleOpen">
											Join us
	        	  	      <Icon type="ios-arrow-down"></Icon>
	        	  	    </a>
	        	  	  	<DropdownMenu slot="list" >
											<router-link @click.native="1" :to="{ name: 'register'}"><p  @click="handleClose(1)">as a seller</p></router-link>
											<router-link @click.native="1" :to="{ name: 'register'}"><p  @click="handleClose(2)">as a buyer</p></router-link>
	        	  	  	</DropdownMenu>
	        	  		</Dropdown>
							</li>
						</ul>
				</div>
				<div v-if="this.authInfo" >
						<ul class="_2menu_main_ul_list_ul">
							<li> <router-link :to="{ path: '/'}">HOME</router-link></li>
							<li><a href="job_browse.html" title="">JOB BROWSE</a></li>
							<li> <router-link :to="{ name: 'order'}">ORDER</router-link></li>
							<li v-if="this.authInfo.userType==1" > <router-link :to="{ name: 'sprofile'}">PROFILE</router-link></li>
							<li v-if="this.authInfo.userType==2" > <router-link :to="{ name: 'bprofile'}">PROFILE</router-link></li>
							<li><a href="/logout" >LOGOUT</a></li>
							<li>
									<div class="_2menu_mess ">
											<i class="fas fa-bell"></i>
											<div class="_2menu_mess_num _bg">3</div>
									</div>
							</li>
							<li>
									<div class="_2menu_mess ">
											<i class="fas fa-envelope"></i>
											<div class="_2menu_mess_num _bg">4</div>
									</div>
							</li>
							<li>
									<div class="_2menu_profile">
											<img class="_2menu_profile_pic" src="img/Rectangle40.png" alt="" title="">
											<div class="_2menu_profile_on _2menu_profile_active"></div>
									</div>
							</li>
						</ul>
				</div>
				</div>
			</div>
				<!--==========================
							Big Menu
				===========================-->
			<div class="_1big_menu" >
				<ul class="_1big_menu_ul">
					<li v-for="(job,i) in alljobs" :key="i">{{job.catName}}</li>
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
				visible: false,
			}
	},
	async created(){
		const res = await this.callApi('get', 'get-all-catgory')
		if(res.status===200){
			this.alljobs = res.data;
		}
		else{
			this.swr();
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
	}
}
</script>



