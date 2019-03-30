<template>
	<div>
   		<div class="_1search_section">
		<div class="_1search_section_main">
			<p class="_1search_section_title">Get your stuff done from $5</p>
			<p class="_1search_section_Sub_title"><i>Browse thought millions of micro jobs. Choose the one your trust. Pay as you go.</i></p>
			<div class="_1search_section_search">
				<p class="_1search_section_search_iam">I am looking for</p>
				<div class="_1search_section_search_int">
					<input class="_1search_section_search_input" v-model="search" placeholder="a logo design" type="text">
				</div>
				<div class="_1search_section_search_button">
					<!-- <router-link > <button class="_1search_section_search_button_btn _bg"  type="button" @click="showdata">SEARCH NOW</button></router-link> -->
					<a > <button class="_1search_section_search_button_btn _bg"  type="button" @click="$router.push(`/marketplace?cat=&str=${search}`)">SEARCH NOW</button></a>
				</div>
			</div>
		</div>
			<!-- <div class="_1search_section_more">
				<i class="_1search_section_more_text">1,000+ more</i>
				<i class="fas fa-angle-down"></i>
			</div> -->
	</div>
			<!--==========================
					Search Section
			===========================-->

	    	<!--==========================
						Home
			=============================-->
				<!--======== Find =========-->
		<div class="find">
			<div class="container">
				<div class="find_title">
					<h2 class="_title _text_center">FIND WHAT YOU NEED</h2>

					<div class="find_row _flex_row" >
						<div class="find_all" v-for="(item,i) in alljobs" :key="i">
							
							
							<div class="find_all_icons _b_color _color">
								<!-- <i class="fas fa-signature"></i> -->
								<img :src="item.image" alt="">
							</div>
							<p class="find_all_title">{{item.catName}}</p>
						</div>

					</div>
					<div class="_dis_flex _see_all _color">
						<p class="_see_all_text _color">SEE ALL CATEGORIES</p>
						<i class="fas fa-chevron-right _color"></i>
					</div>
				</div>
			</div>
		</div>
				<!--======== Find =========-->

				<!--======== Jobs =========-->
		<div class="jobs">
			<div class="container">
				<h2 class="_title _text_center">FEATURED MICRO JOBS</h2>

				<div class="job_row row">
						<!-- items -->
					<div class="col-12 col-md-4 col-lg-3 job_all" v-for="(service,i) in allService" :key="i">
						<div class="_1job_card">
							<div class="_1job_card_rating">
								<ul class="_1job_card_rating_ul" v-if="service.avgreview" >
                                    <li :class="(service.avgreview.averageRating>=1)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(service.avgreview.averageRating>=2)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(service.avgreview.averageRating>=3)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(service.avgreview.averageRating>=4)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(service.avgreview.averageRating>=5)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li class="_1job_card_rating_num">({{service.reviews_count}})</li>
                                </ul>
								<ul class="_1job_card_rating_ul" v-if="service.reviews_count==0" >
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li class=""><i class="fas fa-star"></i></li>
									<li class=""><i class="fas fa-star"></i></li>
									 <li class="_1job_card_rating_num">(0)</li>
								</ul>
							</div>

							<div class="_1job_card_img"><img src="" alt="" sizes="" srcset="">
								<router-link :to="{ name:'details', params:{ id:service.id }}" >
									<img class="_1job_card_img_pic" :src="(service.image[0])? service.image[0].imageUrl : defaultImg" alt="" title="">
								</router-link>
								
							</div>

							<div class="_1job_card_status">
								<p class="_1job_card_status_text _text_overflow2">{{service.title}}</p>
							</div>

							<div class="_1job_card_bottom">
								<p class="_1job_card_by"><span class="_1job_card_by_span">by</span>   {{service.user.userName}}</p>

								<div class="_1job_card_dollar">
									<p class="_1job_card_dollar_text _color">{{service.price}}</p>
									<p class="_1job_card_dollar_sine _color">$</p>
								</div>
							</div>
						</div>
					</div>
						<!-- items -->
				</div>
			</div>
		</div>
				<!--======== Jobs =========-->

				<!--======== Engine =========-->
		<div class="Engine">
			<div class="container">
				<h2 class="_title _text_center">FEATURED MICRO JOBS</h2>

				<div class="row Engine_row">
						<!-- items -->
					<div class="col-12 col-md-4 Engine_main _dis_flex">
						<div class="Engine_icons">
							<i class="fas fa-shopping-basket _color"></i>
						</div>

						<div class="Engine_text">
							<h3 class="Engine_title">Get stuff done</h3>

							<p class="Engine_status">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
						</div>
					</div>
						<!-- items -->

						<!-- items -->
					<div class="col-12 col-md-4 Engine_main _dis_flex">
						<div class="Engine_icons _color">
							<i class="fas fa-shopping-basket _color"></i>
						</div>

						<div class="Engine_text">
							<h3 class="Engine_title">Get stuff done</h3>

							<p class="Engine_status">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
						</div>
					</div>
						<!-- items -->

						<!-- items -->
					<div class="col-12 col-md-4 Engine_main _dis_flex">
						<div class="Engine_icons _color">
							<i class="fas fa-shopping-basket _color"></i>
						</div>

						<div class="Engine_text">
							<h3 class="Engine_title">Get stuff done</h3>

							<p class="Engine_status">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
							tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>
						</div>
					</div>
						<!-- items -->
				</div>

				<div class="_dis_flex _see_all _color">
					<p class="_see_all_text _color">SEE ALL CATEGORIES</p>

					<i class="fas fa-chevron-right _color"></i>
				</div>
			</div>
		</div>

		
	</div>


</template>

<script>
export default {
	data(){
		return{
			allService:[],
			alljobs:[],
			search:'',
			defaultImg:'img/V90.jpg',

		}
	},
	async created(){
		//	const res = await this.callApi('post', 'register', this.regesterData)
			const res = await this.callApi('get', 'get-all-service')
			if(res.status===200){
				this.allService = res.data;
			}
			else{
				this.swr();
			}
			const res1 = await this.callApi('get', 'get-all-category')
			if(res1.status===200){
				this.alljobs = res1.data;
			}
			else{
				this.swr();
			}
			//console.log(this.allService)

	},
	methods:{
	async showdata(){
				this.$store.dispatch('setFlag',2);
				this.$store.dispatch('setSearchData',this.search);
			
				
		}
	}
}
</script>s
