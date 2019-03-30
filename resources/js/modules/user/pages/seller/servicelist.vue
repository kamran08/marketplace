<template>
    <div>
        <div class="_profile_card_all tags_all" v-if="list.length && isloading" >
            <!-- card -->
            <div v-for="(item,index) in list" :key="index" >
                <div class="_profile_card _dis_flex _box_shadow2 _border_radious _mr_b30 "  >
                    <div class="_profile_card_pic">
                         <router-link :to="{ name:'details', params:{ id:item.id }}" ><img  class="_profile_card_img" :src="item.image[0].imageUrl" alt="" title=""></router-link>
                    </div>
                    <div class="_profile_card_name _flex_space _dis_flex">
                        
                        <div class="_profile_card_title _flex_space">
                            <p class="_profile_card_name_text_link"><router-link :to="{ name:'details', params:{ id:item.id }}" >{{item.title}}</router-link></p> 
                        </div>
                        <div class="Details_profie_rating">
                                <ul class="_1job_card_rating_ul" v-if="item.reviews_count!==0" >
                                    <li :class="(item.avgreview.averageRating>=1)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(item.avgreview.averageRating>=2)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(item.avgreview.averageRating>=3)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(item.avgreview.averageRating>=4)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(item.avgreview.averageRating>=5)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li class="_1job_card_rating_num">({{item.reviews_count}})</li>
                                </ul>
								<ul class="_1job_card_rating_ul" v-else  >
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li><i class="fas fa-star"></i></li>
									<li><i class="fas fa-star"></i></li>
									<li>(0)</li>
								</ul>
                        </div>
                        <div class="_profile_card_title _flex_space">
                            <div  class="_profile_card_name_text_link">Extra Service : 
                                     <!-- <span class="job_tags_main" v-for="(ex, k) in item.extraService" :key="k">  {{ex.serviceName}} </span> -->
                                     <div class="job_tags"  v-for="(ex, k) in item.extra" :key="k"> 
                                        <div class="job_tags_main">  {{ex.serviceName}}(${{ex.servicePrice}}) </div>
                                    </div>
                            </div>
                        
                        </div>
                         <div class="_dis_flex _profile_card_doller">
                            <div class="_1job_card_dollar">
                                <p class="_1job_card_dollar_text _color"> {{item.price}}</p>
                                <p class="_1job_card_dollar_sine _color">$</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        <div span="14" align="center" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
           <h2>Loading .....</h2>
        </div>
        <!-- card -->
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            toDayDate:'',
            user_id:this.$route.params.id,
            isloading:true
        }
    },
    methods:{
        async getServiceList(){
            this.isloading = false
            const res  = await  this.callApi('get',`getServiceList/${this.user_id}`)
            if(res.status===200){
                this.list = res.data
                
            }
            else{
                this.swr();
            }
            this.isloading = true
        },
    },
    created(){
        this.getServiceList();
    }
}
</script>

<style>

</style>
