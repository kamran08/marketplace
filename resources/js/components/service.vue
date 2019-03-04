<template>
    <div>
        <!-- <headsSction/> -->
		 	<!--==========================
						Marketplace
			=============================-->
				<!--======== Banner =========-->
		<div class="_banner">
		    <div class="container">
		        <div class="_banner_main">
		            <h2 class="_banner_title">Earm money with us</h2>

		            <div class="_banner_button">
		            <!-- //	<p class="_banner_post_title">Post a Job</p>  -->
							<p class="_banner_post_title"> <router-link :to="{ name: 'jobpost'}">Post a Job</router-link></p>
		            	<p class="_banner_cirlce_plus">
		            		<i class="fa fa-plus"></i>
		            	</p>
		            </div>
		        </div>
		    </div>

		    <div class="_banner_images">
                <img class="_banner_pic" src="img/banner.png" alt="Post a mJob banner">
            </div>
		</div>
				<!--======== Banner =========-->

				<!--======== Content =========-->
		<div class="Marketplace_content">
			<div class="container">
					<!--~~~~ Title and Filter ~~~~~~~-->
				<div class="_title_header _b_color2" >
					<h3 class="_title">{{allcatagoryBysearch.length}} SERVICES AVAILABLE</h3>

					<div class="Marketplace_filter _dis_flex">
						<!-- <p class="_search_num">100+ jobs in Grapphics &Design </p> -->

						<div class="_flex_space"></div>

						<div class="Marketplace_filter_main _dis_flex">
							<input class="_filter_btn filter_drop _b_color2" type="text">Filter</input>
							<button class="_filter_btn filter_bg _b_color2" type="button"><i class="fas fa-align-justify"></i></button>
							<button class="_filter_btn _b_color2" type="button"><i class="fas fa-align-justify"></i></button>
						</div>
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
										<li >
											<!-- class="_Categories_menu_active" -->
											All
											
											<!-- <i class="fas fa-chevron-down _down"></i> -->

												<!--=== Sub Categories ====-->
											<!-- <div class="_Categories_sub">
												<ul class="_Categories_sub_ul">
													<li>Other</li>
													<li class="_Categories_menu_active">3d & 2D Models</li>
													<li>T-Shirts</li>
													<li>Book Covers & Packaging</li>
												</ul>
											</div> -->
												<!--=== Sub Categories ====-->
										</li>
										<li v-for="(item,i) in allcatagory" :key="i" @click="filterbySelect(item.catName)">{{item.catName}}</li>
									
									</ul>
								</div>
							</div>
						</div>
							<!-- Categories Menu -->

							<!-- Product -->
						<div class="col-12 col-md-9">
							<div class="Marketplace_search_result_prduct">
								<div class="row">
										<!-- items -->
									<div class="col-6 col-md-4 job_all"  v-for="(item,i) in allcatagoryBysearch" :key="i">
										
										<div class="_1job_card" >
											<div class="_1job_card_rating">
												<ul class="_1job_card_rating_ul">
													<li class="_color"><i class="fas fa-star"></i></li>
													<li class="_color"><i class="fas fa-star"></i></li>
													<li class="_color"><i class="fas fa-star"></i></li>
													<li class=""><i class="fas fa-star"></i></li>
													<li class=""><i class="fas fa-star"></i></li>
													<li class="_1job_card_rating_num">(2k+)</li>
												</ul>
											</div>
											<div v-if="item.image.length>0">
												<div class="_1job_card_img" v-for="(img,j) in item.image.slice(1)" :key="j">
										
												<img class="_1job_card_img_pic" :src="img.imageName" alt="" title="">		
											</div>
											</div>
											<div v-if="!item.image.length">
												<div class="_1job_card_img">
										
												<img class="_1job_card_img_pic" :src="defaultImage" alt="" title="">
												
											</div>
											</div>


											

											<div class="_1job_card_status">
												<p class="_1job_card_status_text _text_overflow2">{{item.description}}</p>
											</div>

											<div class="_1job_card_bottom">
												<p class="_1job_card_by"><span class="_1job_card_by_span">by</span> {{item.users.userName}}</p>

												<div class="_1job_card_dollar">
													<p class="_1job_card_dollar_text _color">{{item.price}}</p>
													<p class="_1job_card_dollar_sine _color">$</p>
												</div>
											</div>
										</div>
									</div>
										<!-- items -->

									

									


								</div>

									<!-- pagination -->
								<div class="_pagination">
									<ul class="_pagination_ul">
										<li>&laquo;</li>
										<li>1</li>
										<li>2</li>
										<li class="_pagination_actiove">3</li>
										<li>4</li>
										<li>5</li>
										<li>6</li>
										<li>&raquo;</li>
									</ul>
								</div>
									<!-- pagination -->
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

        <!-- <footsSction/> -->
    </div>

</template>
<script>
import headsSction from './pages/header.vue'
import footsSction from './pages/footer.vue'
export default {
    data(){
        return{
			allcatagoryBysearch:[],
			allcatagory:[],
			ok:'',
			defaultImage:'uploads/_85730600_monkey2.jpg',
			
        }
	},
	async created(){
			const res = await this.callApi('get', 'get-all-catgory')
			if(res.status===200){
				this.allcatagory = res.data
			} 
			const res1 = await this.callApi('get', `get-all-catgory-by-search/${this.searchData}`)
			if(res1.status===200){
				this.allcatagoryBysearch = res1.data
				console.log(res1.data.image.imageName)
			} 
			// const res = await this.callApi('get', 'get-all-service-by-search',this.searchData)
			// this.allService = res.data;
	},
    components:{
        headsSction,
        footsSction
    },
    methods:{
		async filterbySelect(e){
			this.$store.dispatch('setSearchData',e);
			//console.log(this.searchData)

			const res2 = await this.callApi('get', `get-all-catgory-by-search/${this.searchData}`)
			this.allcatagoryBysearch =res2.data
		}
	}

}
</script>

