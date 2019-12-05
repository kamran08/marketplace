<template>
    <div>
				<!--======== Banner =========-->
	<!-- <section id="main_banner_area" class="p_top_bottom">
        <div class="container">
            <div class="main_banner_head_top">
                
                <div class="banner_input_link">
                    <form action="" class="banner_input_form _marketplace_form">
						<div class="search_location">
                            <select class="search_location_select" v-model="locationData" @change="getSerchData" >
                                <option disabled value="">Select Loction</option>
								 <option value="all">ALL</option>
                                <option v-for="(item,index) in allLocation" :value="item.id" :key="index">{{ item.location }}</option>
                            </select>
                            <i class="fas fa-map-marker-alt"></i>
                        </div>

                        <div class="search_input">
                            <input type="search" id="banner_search" v-model="search" placeholder="I Am Looking For">
                            <i class="fas fa-search" @click="$router.push(`/marketplace?cat=&str=${search}&loc=`)"></i>
                            <i class="fas fa-search" @click="getSerchData"></i>
                        </div>
                    </form>
                </div>
               
            </div>
        </div>
    </section> -->
	<section id="main_banner_area" class="p_top_bottom">
        <div class="container">
            <div class="main_banner_head_top">
                <div class="banner_category_link">
                    <div class="banner_category_link_single" :class="(selectedIndex==i)?'_1active':''" v-for="(item,i) in alljobs" :key="i" @click="SelectCategory(item,i)">
                        <div class="banner_category_link_single_als">
                        <!-- <div class="banner_category_link_single" v-for="(item,i) in alljobs" :key="i" @click="$router.push(`/marketplace?cat=${item.id}`)"> -->
                            <div class="banner_category_xtra_link active ">
                                <img :src="item.image" class="img-fluid" alt="">
                            </div>
                            <h4 class="text_overflow1 textas">{{item.catName}}</h4>
                        </div>
                    </div>
                 
                </div>
                <div class="banner_input_link">
                    <form action="" class="banner_input_form">
                        <div class="search_location">
                             <Select filterable remote :remote-method="remoteMethod1"  v-model="locationData" style="width:100%" @on-change="getSerchData">
                                <Option v-for="(item,index) in allLocation" :value="item.id" :key="index">{{ item.location }}</Option>
                            </Select>
                        </div>

                        <div class="search_input">
                            <input class="_1ints" type="search" id="banner_search" v-model="search" placeholder="I Am Looking For">
                            <!-- <i class="fas fa-search" @click="$router.push(`/marketplace?cat=${catId}&str=${search}&loc=${locationData}`)"></i> -->
                            <i class="fas fa-search" @click="getSerchData"></i>
                        </div>

                        <div class="_header_button">
                            <!-- <button @click="$router.push(`/marketplace?cat=${catId}&str=${search}&loc=${locationData}`)" class="_header_btn" type="button">Search</button> -->
                            <button @click="getSerchData" class="_header_btn" type="button">Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>






				<!--======== Banner =========-->
				
		
		<!-- <div span="14" align="center" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
           <h2>Loading .....</h2>
        </div> -->
				<!--======== Content =========-->
		<div class="Marketplace_content">
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
							<div class="col-12 col-md-9">

								<div class="Marketplace_search_result_prduct">
									<div class="job_row row">
										<div class="col-12 col-md-4 col-lg-4 job_all" v-if="isloading && products.data.length==0">
											<div class="">
												<p>SERVICE NOT AVAILABLE</p>
											</div>
										</div>

										<!-- Shimmer -->
										<div class="col-12 col-md-4 col-lg-4"  v-for="item in 9" v-if="!isloading">
											<div class="feature_cart_item">
												<div class="_7timeline-item">
													<div class="_7animated-background">
														<div class="_7background-masker _7header-top"></div>
														<div class="_7background-masker _7header-left"></div>
														<div class="_7background-masker _7header-right"></div>
														<div class="_7background-masker _7header-bottom"></div>
														<div class="_7background-masker _7subheader-left"></div>
														<div class="_7background-masker _7subheader-right"></div>
														<div class="_7background-masker _7subheader-bottom"></div>
														<div class="_7background-masker _7subheader_topright"></div>
														<div class="_7background-masker _7subheader_bottomright"></div>
													</div>
												</div>
											</div>
										</div>
										<!-- Shimmer -->

										<div class="col-md-4" v-for="(service,i) in products.data" :key="i">
											<div class="feature_cart_item"  @click="$router.push('details/'+service.id)">
												<div class="feature_cart_img">
													<img :src="(service.image[0])? service.image[0].imageUrl : defaultImg" alt="" title="">
													<div class="feature_cart_pricing">
														<span class="currency">£</span>
														<span>{{service.price}}</span>
													</div>
													<p class="feature_text" v-if="service.isFeatured==1">featured</p>
												</div>
												<div class="feature_cart_content">
													<h4 class="text_overflow1">{{service.title}}</h4>
													<div class="feature_cart_content_rating">
														<!-- <router-link :to="{ name:'details', params:{ id:service.id }}" > -->
														<img :src="`${service.user.image}`" alt="" title="">
														<!-- </router-link> -->
														<div class="_5cards_rating">
															<p class="ok">{{service.user.name}}</p>
															<ul class="_1job_card_rating_ul" v-if="service.avgreview">
																<li :class="(service.avgreview.averageRating>=1)? '_color' : ''"><i class="fas fa-star"></i></li>
																<li :class="(service.avgreview.averageRating>=2)? '_color' : ''"><i class="fas fa-star"></i></li>
																<li :class="(service.avgreview.averageRating>=3)? '_color' : ''"><i class="fas fa-star"></i></li>
																<li :class="(service.avgreview.averageRating>=4)? '_color' : ''"><i class="fas fa-star"></i></li>
																<li :class="(service.avgreview.averageRating>=5)? '_color' : ''"><i class="fas fa-star"></i></li>

																<li class="_1job_card_rating_num">({{service.reviews_count}})</li>
															</ul>
															<ul class="_1job_card_rating_ul" v-if="service.reviews_count==0">
																<li><i class="fas fa-star"></i></li>
																<li><i class="fas fa-star"></i></li>
																<li><i class="fas fa-star"></i></li>
																<li><i class="fas fa-star"></i></li>
																<li><i class="fas fa-star"></i></li>
																<li class="_1job_card_rating_num">(0)</li>
															</ul>
														</div>
													</div>
												</div>
											</div>

										</div>

									</div>
									<div class="card-footer" v-if="products.total>0">
											 <Page :current="products.current_page" :total="products.total" @on-change="getResults" :page-size="products.per_page" />
									</div>
								</div>
							</div>
					</div>
				</div>
										
			</div>
		</div>
									

					
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
			products: [],
			isloading:true,
			selectedMune:-1, 
			catId: '',
			search:'',
			allLocation:[],
			locationData:'',
			selectedIndex:0,
			seletedItemId:'',
			alljobs:[]
			
        }
	},
    methods:{
		remoteMethod1(){},
			async SelectCategory(item,index){
            this.catId = item.id
            this.selectedIndex = index
			this.seletedItemId = item
			this.getSerchData()

		},
		
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
				this.isloading = true
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
		    this.$router.push(`/marketplace?cat=${item.id}&str=${a}&loc=`)
	   },
	   	async getResults(page = 1) {
			 const res = await this.callApi('get','get-all-catgory-by-search?page='+page)
			 this.products = res.data;
		},
	   	async getSerchData() {
			   this.isloading = false
			   let str = ''
			   let cat = ''
			   let loc = ''
			   str = this.search
			   loc = this.locationData
			   cat = this.catId
			   let url = `get-all-catgory-by-search?str=${this.search}&cat=${cat}&loc=${loc}`
			   await this.getAllServices(url)
			   
		},
		 async getlocations(){
             const res = await this.callApi('get','location')
            if(res.status===200){
				this.allLocation = res.data
				if(!this.locationData){
					this.locationData = ''
					console.log("location id", this.locationData)
				}
				
            }
            else{
                this.swr()
            }

         }

	},

	
	async created(){
		this.getlocations()
		let str = ''
		let cat = ''
		let loc = ''
		if(this.$route.query.str){
			str = this.$route.query.str
			
		}
		if(this.$route.query.loc){
			loc = this.$route.query.loc
			this.locationData  = loc
			console.log("location id d", this.locationData)
		}
		if(this.$route.query.cat){
			cat = this.$route.query.cat
			this.catId = this.$route.query.cat
		}
		this.get_all_category();
		let url = `get-all-catgory-by-search?str=${str}&cat=${cat}&loc=${loc}`
		this.getAllServices(url)
		const res1 = await this.callApi('get', 'get-all-category')
			if(res1.status===200){
                this.alljobs = res1.data;
			}
			else{
				this.swr();
		}
	
		
	},

}
</script>
<style>
.something{

}
</style>
