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
						<div class="find_all pointer" v-for="(item,i) in alljobs" :key="i" @click="$router.push(`/marketplace?cat=${item.id}`)">
							
							
							<div class="find_all_icons _b_color _color">
								<!-- <i class="fas fa-signature"></i> -->
								<img :src="item.image" alt="">
							</div>
							<p class="find_all_title">{{item.catName}}</p>
						</div>

					</div>
					<div class="_dis_flex _see_all _color">
						<p class="_see_all_text _color" @click="$router.push('/marketplace')">BROWSE ALL SERVICES</p>
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
					<div class="col-12 col-md-4 col-lg-3 job_all" v-for="(service,i) in allService.data" :key="i">
						<div class="_1job_card">

							<div class="_1job_card_img"><img src="" alt="" sizes="" srcset="">


								<router-link :to="{ name:'details', params:{ id:service.id }}" >
									<img class="_1job_card_img_pic" :src="(service.image[0])? service.image[0].imageUrl : defaultImg" alt="" title="">
								</router-link>
								
							</div>

							<div class="_1job_card_status">
								<p class="_1job_card_status_text _text_overflow">{{service.title}}</p>
							</div>



							<div class="_1job_card_dollar">
								<p class="_1job_card_dollar_text _color">{{service.price}}</p>
								<p class="_1job_card_dollar_sine _color">£</p>
							</div>

							<div class="_1job_card_bottom">
								<div class="_5cards_user">
									<div class="_5cards_user_pic">
										<img class="_5cards_user_img" :src="`${service.user.image}`" alt="" title="">
									</div>

									<div class="_5cards_user_details">
										<p class="_5cards_user_name">{{service.user.name}}</p>

										<div class="_5cards_rating">
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
										<p class="_5cards_user_name">{{service.serviceType}}</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					
						<!-- items -->
				</div>
				 <div class="card-footer">
					 <Page :current="1" :total="allService.total" @on-change="getResults" :page-size="8"/>
					  <!-- <Page :total="allService.total" prev-text="Previous" next-text="Next" /> -->
					 <!-- <Page :total="allService.last_page" show-total /> -->
				<!-- <pagination :data="allService" @pagination-change-page="getResults" class="page2"> 

				</pagination> -->
				
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
						
						<p class="k_p">Ms4. Co is a fast rising marketplace for Beauty and Healthcare enthusiast in London. Our online platform allows independent, individual and groups of beauty and healthcare experts who offer mobile services to: list, advertise, promotes and ultimately access bookings from interested clients in your local area.  In a bid to help your business grow, Ms4 offers you the opportunity to promote your services and connect with prospective clients for FREE.	</p>
						<p class="k_p">We at Ms4.co are committed to exposing your services to a large number of interested clients by building your online reputation in the beauty and healthcare industry.</p>
						<p class="k_p">Clients will be able to explore a community of talented beauty and healthcare experts to find the right professional for all your healthcare and beauty needs. Our main goal is to give you and exceptional, online booking experience to save you the stress of going to the spa.</p>
						<p class="k_p">It doesn’t matter whether your busy schedule does not avail you the opportunity to visit a spa or beauty parlour. On Ms4.co, you can have the luxury of booking a healthcare specialist who’s ready to come to your home, hotel or office.</p>
						<p class="k_p">What’s more, you’ll find everything you need on the site. Get in touch with our beauty experts today – enjoy the affordable services that are on offer for you.</p>
						<!-- items -->
				</div>

				<div class="_dis_flex _see_all _color">
					<p class="_see_all_text _color" @click="$router.push('/marketplace')">SEE ALL CATEGORIES</p>

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
			allService:{},
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
				
					
		},
		async getResults(page = 1) {
			 const res = await this.callApi('get','get-all-service?page='+page)
			 this.allService = res.data;
		}
	}
}
</script>

<style>


</style>
