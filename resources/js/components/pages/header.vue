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
							<li><a href="" title="">Job Brower</a></li>
							<li><router-link :to="{ name: 'login'}"> Sign in </router-link></li>
							<li class="_1menu_sign_ul_or">or</li>
							<li><router-link :to="{ name: 'register'}">Join Us</router-link></li>
							
						</ul>
				</div>
				<div v-if="this.authInfo" >
						<ul class="_2menu_main_ul_list_ul">
							<li> <router-link :to="{ path: '/'}">HOME</router-link></li>
							<li><a href="" title="">JOB BROWSE</a></li>
							<!-- <li> <router-link :to="{ name: 'order'}">ORDER</router-link></li> -->
							<li v-if="authInfo.userType==1" > <router-link :to="{ name: 'sprofile', params: { id : authInfo.id}}">{{authInfo.name}}</router-link></li>
							<li v-if="authInfo.userType==2" > <router-link :to="{ name: 'bprofile', params: { id : authInfo.id}}">{{authInfo.name}}</router-link></li>
							<li v-if="authInfo.userType==4" ><a href="/system_admin">{{authInfo.name}}(Dashboard)</a></li>
							<li><a href="/logout" >LOGOUT</a></li>
							<li v-if="authInfo" >
									<div class="_2menu_mess ">
											<i class="fas fa-bell"></i>
											<div class="_2menu_mess_num _bg">3</div>
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
				defultImage:"/img/prfile.png"
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



