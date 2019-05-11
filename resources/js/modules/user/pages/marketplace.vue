<template>
    <div>
     
		 	<!--==========================
						Marketplace
			=============================-->
				<!--======== Banner =========-->
		<div class="_banner">
		    <div class="container">
		        <div class="_banner_main">
		            <h2 class="_banner_title"  v-if="authInfo.userType==1" >Earn money with us</h2>
		            <h2 class="_banner_title"  v-else >EXPLORE THE AWESOME SERVIES</h2>

		            <div class="_banner_button" v-if="authInfo.userType==1" >
						<router-link :to="{ name: 'jobDescription'}">
							<p class="_banner_post_title uper">Post a service</p>
		            		<p class="_banner_cirlce_plus">
		            			<i class="fa fa-plus"></i>
		            		</p>
						</router-link>
		            </div>
		        </div>
		    </div>

		    <div class="_banner_images">
                <img class="_banner_pic" src="img/banner.png" alt="Post a mJob banner">
            </div>
		</div>
				<!--======== Banner =========-->
		
		<div span="14" align="center" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
           <h2>Loading .....</h2>
        </div>
				<!--======== Content =========-->
		<div class="Marketplace_content" v-if="isloading">
			<div class="container">
					<!--~~~~ Title and Filter ~~~~~~~-->
				<div class="_title_header _b_color2" >
					<h3 class="_title">{{products.length}} SERVICES AVAILABLE</h3>

					<div class="Marketplace_filter _dis_flex">
						<!-- <p class="_search_num">100+ jobs in Grapphics &Design </p> -->

						<div class="_flex_space"></div>

						<!-- <div class="Marketplace_filter_main _dis_flex">
							<input class="_filter_btn filter_drop _b_color2" type="text">Filter</input>
							<button class="_filter_btn filter_bg _b_color2" type="button"><i class="fas fa-align-justify"></i></button>
							<button class="_filter_btn _b_color2" type="button"><i class="fas fa-align-justify"></i></button>
						</div> -->
					</div>
				</div>
					<!--~~~~ Title and Filter ~~~~~~~-->

					<!--~~~~ Categories Menu and Product ~~~~~~~-->
				<div class="Marketplace_search_result">
					<div class="row">
							<!-- Categories Menu -->
						<div class="col-12 col-md-3">
							<div class="Marketplace_Categories_menu">
								<div class="Marketplace_Categories_menu_title">
									<h3 class="_title2">CATEGORIES</h3>
								</div>

								<div class="_Categories_menu">
									<ul class="_Categories_menu_ul">
										<li @click="$router.push('/marketplace')" class="uper">
											All
										</li>
										<li v-for="(item,i) in allcatagory" :key="i" @click="searchWithSelect(item,i)" class="uper" :class="catId==item.id? 'manue_selected' : ''">{{item.catName}}</li>
									
									</ul>
								</div>
							</div>
						</div>
							<!-- Categories Menu -->

							<!-- Product -->
						<div class="col-12 col-md-9">
							<div class="Marketplace_search_result_prduct">
								<div class="job_row row">
											<!-- items -->
										
										<div class="col-12 col-md-4 col-lg-4 job_all" v-for="(service,i) in products.data" :key="i">
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
														<!--  -->
													</div>
												</div>
												
											</div>
																	<!-- items -->
										</div>
										<div class="card-footer">
											 <Page :current="1" :total="products.total" @on-change="getResults" :page-size="6" />
											<!-- <pagination :data="products" @pagination-change-page="getResults" class="page2"> 

											</pagination> -->
										
										</div>


														
													</div>
												</div>
													<!-- Product -->
											</div>
										</div>
											<!--~~~~ Categories Menu and Product ~~~~~~~-->
									</div>
								</div>
										<!--======== Content =========-->
									<!--==========================
												Home
									========================-->

						<!-- <paginate
							:page-count="20"
							:page-range="3"
							:margin-pages="2"
							:click-handler="clickCallback"
							:prev-text="'Prev'"
							:next-text="'Next'"
							:container-class="'pagination'"
							:page-class="'page-item'">
						</paginate> -->
							</div>

						</template>
						<script>

export default {

    data(){
        return{
			allcatagoryBysearch:[],
			allcatagory:[],
			ok:'',
			id:'',
			defaultImage:'uploads/_85730600_monkey2.jpg',
			allServices: [],
			products: {},
			isloading:true,
			selectedMune:-1, 
			catId: null
			
        }
	},
    methods:{
		
		async get_all_category(){
			this.isloading = false
			const res = await this.callApi('get', 'get-all-catgory')
			if(res.status===200){
				this.allcatagory = res.data
				this.isloading = true
			}
			else{
				this.swr();
				this.isloading = true
			}
		},
		async filterbySelect(key){
			const res = await this.callApi('get', `get-all-catgory-by-search/${key}`)
			if(res.status===200){
				this.s("SearchDay");
				console.log(res.data);
			}
			else{
				this.swr();
			}
		},
		async getAllServices(url){
			const res = await this.callApi('get', url)
			if(res.status===200){
				this.products = res.data
				console.log(this.products)
			}else{
				swr()
			}
		},
	   searchWithSelect(item,i){
		   	let a 
			if(!this.$route.query.str){
				 a = ''
			}
			else {
				a = this.$route.query.str
			}
		    this.$router.push(`/marketplace?cat=${item.id}&str=${a}`)
	   },
	   	async getResults(page = 1) {
			 const res = await this.callApi('get','get-all-catgory-by-search?page='+page)
			 this.products = res.data;
		}

	},

	
	async created(){
		let str = ''
		let cat = ''
		if(this.$route.query.str){
			str = this.$route.query.str
			
		}
		if(this.$route.query.cat){
			cat = this.$route.query.cat
			this.catId = this.$route.query.cat
		}
		this.get_all_category();
		let url = `get-all-catgory-by-search?str=${str}&cat=${cat}`
		this.getAllServices(url)
	},

}
</script>

