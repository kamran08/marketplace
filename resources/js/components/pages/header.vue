<template>
    
<div>

	<div class="_1menu _1flex">
			<div class="_1menu_logo">
				<img class="_1menu_logo_pic" src="img/logo.png" title="" alt="">
			</div>

			<div class="_1menu_search _1flex">
				<i class="fas fa-search"></i>

				<div class="_1menu_input _1flex_space">
					<input class="_1menu_input_int" placeholder="hussaion shiopu" type="text" name="fname">
				</div>
			</div>

			<div class="_1menu_sign _1flex_space">
				<ul class="_1menu_sign_ul">
                    <!-- <li>Sign in</li>  -->
					<template v-if="!this.authInfo">
						<li class="_1menu_sign_color"> <router-link :to="{ name: 'login'}"> Sign in </router-link></li>
						<li class="_1menu_sign_ul_or">or</li>
						<li class="_1menu_sign_color">  Join us 
							<Dropdown trigger="custom" :visible="visible" style="margin-left: 20px margn-right:20px">
          	    <a href="javascript:void(0)" @click="handleOpen">
          	      <Icon type="ios-arrow-down"></Icon>
          	    </a>
          	  	<DropdownMenu slot="list" >
									<router-link @click.native="1" :to="{ name: 'register'}"><p  @click="handleClose(1)">as a seller</p></router-link>
									<router-link @click.native="1" :to="{ name: 'register'}"><p  @click="handleClose(2)">as a buyer</p></router-link>
          	  	</DropdownMenu>
          		</Dropdown>
						</li>
					</template  >
					<template v-if="this.authInfo" >
						<li class="_1menu_sign_color"> <router-link :to="{ name: 'order'}"> order </router-link></li>
						<li class="_1menu_sign_color"> <router-link :to="{ name: 'profile'}"> profile </router-link></li>
						<li class="_1menu_sign_color"> <router-link :to="{ name: 'details'}"> details </router-link></li>
						<a href="/logout" >
								<li class="_1menu_sign_color" >logout</li>
						</a>
					</template>

					
					<!-- //	<li class="_1menu_sign_color">Join us</li> -->
				</ul>
			</div>
		</div>
			<!--==========================
						menu
			===========================-->

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

