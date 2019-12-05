<template>
	<div>
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
                             <Select filterable remote :remote-method="remoteMethod1" :loading="loading1" v-model="locationData" style="width:100%">
                                <Option v-for="(item,index) in allLocation" :value="item.id" :key="index">{{ item.location }}</Option>
                            </Select>
                        </div>

                        <div class="search_input">
                            <input class="_1ints" type="search" id="banner_search" v-model="search" placeholder="I Am Looking For">
                            <i class="fas fa-search" @click="$router.push(`/marketplace?cat=${catId}&str=${search}&loc=${locationData}`)"></i>
                        </div>

                        <div class="_header_button">
                            <button @click="$router.push(`/marketplace?cat=${catId}&str=${search}&loc=${locationData}`)" class="_header_btn" type="button">Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

	  <section id="brighter_beauty" class="text-center p_top_bottom ">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_head">
                        <h3>The brighter way to look beauty</h3>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="brighter_beauty_single_cart">
                        <div class="brighter_beauty_img">
                            <img src="img/beauti-1.svg" alt="">
                        </div>
                        <div class="brighter_beauty_content">
                            <h4>Smart Prices</h4>
                            <p>Just book last-minute, or off-peak</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="brighter_beauty_single_cart">
                        <div class="brighter_beauty_img">
                            <img src="img/beauti-2.svg" alt="">
                        </div>
                        <div class="brighter_beauty_content">
                            <h4>book 24/7</h4>
                            <p>From bed, or the bus</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="brighter_beauty_single_cart">
                        <div class="brighter_beauty_img">
                            <img src="img/beauti-3.svg" alt="">
                        </div>
                        <div class="brighter_beauty_content">
                            <h4>Choice of top-rated salons</h4>
                            <p>Thousands of venues (and reviews)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<section id="feature_cart_area" class="text-center p_top_bottom">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_head">
                        <h3>FEATURED MICRO JOBS</h3>
                    </div>
                </div>

                <!-- Shimmer -->
                <div class="col-12 col-md-4 col-lg-4" v-for="item in 9" v-if="!isloading">
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

                <!-- no data forund -->
                <div class="col-md-4" v-if="isloading && allService.data.length==0">
                    <h2 >No Featured Sercices</h2>
                </div>
                <!-- no data forund -->

                <div class="col-md-4" v-for="(service,i) in allService.data" :key="i">
                    <div class="feature_cart_item">
                        <div class="feature_cart_img">
                            <img :src="(service.image[0])? service.image[0].imageUrl : defaultImg" alt="" title="" @click="$router.push('details/'+service.id)">
                            <div class="feature_cart_pricing">
                                <span class="currency">£</span>
                                <span>{{service.price}}</span>
                            </div>
                            <p class="feature_text">featured</p>
                        </div>
                        <div class="feature_cart_content">
                            <h4 class="text_overflow1">{{service.title}}</h4>
                            <div class="feature_cart_content_rating">
                                <!-- <router-link :to="{ name:'details', params:{ id:service.id }}" > -->
                                <img :src="`${service.user.image}`" alt="" title="" >
                                <!-- </router-link> -->
									<div class="_5cards_rating">
                                        <p class="ok">{{service.user.name}}</p>
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
												<li ><i class="fas fa-star"></i></li>
												<li ><i class="fas fa-star"></i></li>
												<li class="_1job_card_rating_num">(0)</li>
											</ul>
									</div>
                            </div>
                        </div>
                    </div>
					
                </div>
            </div>
			<div class="p_top_bottom" v-if="allService.total>0">
					 <Page :current="allService.current_page" :total="allService.total" @on-change="getResults" :page-size="allService.per_page"/>
			</div>
        </div>
    </section>





		

		
				<!--======== Jobs =========-->

				<!--======== Engine =========-->
		<!-- <div class="Engine">
			<div class="container">
				<h2 class="_title _text_center">FEATURED MICRO JOBS</h2>

				<div class="row Engine_row">
						
						<p class="k_p">Ms4. Co is a fast rising marketplace for Beauty and Healthcare enthusiast in London. Our online platform allows independent, individual and groups of beauty and healthcare experts who offer mobile services to: list, advertise, promotes and ultimately access bookings from interested clients in your local area.  In a bid to help your business grow, Ms4 offers you the opportunity to promote your services and connect with prospective clients for FREE.	</p>
						<p class="k_p">We at Ms4.co are committed to exposing your services to a large number of interested clients by building your online reputation in the beauty and healthcare industry.</p>
						<p class="k_p">Clients will be able to explore a community of talented beauty and healthcare experts to find the right professional for all your healthcare and beauty needs. Our main goal is to give you and exceptional, online booking experience to save you the stress of going to the spa.</p>
						<p class="k_p">It doesn’t matter whether your busy schedule does not avail you the opportunity to visit a spa or beauty parlour. On Ms4.co, you can have the luxury of booking a healthcare specialist who’s ready to come to your home, hotel or office.</p>
						<p class="k_p">What’s more, you’ll find everything you need on the site. Get in touch with our beauty experts today – enjoy the affordable services that are on offer for you.</p>
				</div>

				<div class="_dis_flex _see_all _color">
					<p class="_see_all_text _color" @click="$router.push('/marketplace')">SEE ALL CATEGORIES</p>

					<i class="fas fa-chevron-right _color"></i>
				</div>
			</div>
		</div> -->
	
		
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
            allLocation:[],
            locationData:'',
            catId:'',
            selectedIndex:0,
            seletedItemId:'',
            isloading:false
		

		}
	},
	async created(){
        this.getlocations()
        //	const res = await this.callApi('post', 'register', this.regesterData)
        
			const res = await this.callApi('get', 'get-all-featured-service')
			if(res.status===200){
                this.allService = res.data;
                this.isloading = true
			}
			else{
				this.swr();
			}
			const res1 = await this.callApi('get', 'get-all-category')
			if(res1.status===200){
                this.alljobs = res1.data;
                this.catId = ''
			}
			else{
				this.swr();
			}
			//console.log(this.allService)

	},
	methods:{
        remoteMethod1(){},
		async showdata(){
            this.$store.dispatch('setFlag',2);
            this.$store.dispatch('setSearchData',this.search);
		},
		async SelectCategory(item,index){
            this.catId = item.id
            this.selectedIndex = index
            this.seletedItemId = item

		},
		async getResults(page = 1) {
			 const res = await this.callApi('get','get-all-featured-service?page='+page)
			 this.allService = res.data;
        },
         async getlocations(){
             const res = await this.callApi('get','location')
            if(res.status===200){
                this.allLocation = res.data
            }
            else{
                this.swr()
            }

         }
     
	}
}
</script>

<style>
.activeClas{

}
</style>
