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
					<li class="_1menu_sign_color"> <router-link :to="{ name: 'login'}"> Sign in </router-link></li>
					<li class="_1menu_sign_color"> <router-link :to="{ name: 'check'}"> check </router-link></li>
					<li class="_1menu_sign_ul_or">or</li>
                   <li class="_1menu_sign_color"> <router-link :to="{ name: 'register'}"> Join us </router-link></li>
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
			alljobs:[]
		}
	},
	async created(){
		//	const res = await this.callApi('post', 'register', this.regesterData)
			const res = await this.callApi('get', 'get-all-catgory')
			this.alljobs = res.data;
			// console.log(this.alljobs)

	},
}
</script>

