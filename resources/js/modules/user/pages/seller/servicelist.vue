<template>
    <div>
        <div class="_profile_card_all" v-if="list.length && isloading" >
            <!-- card -->
              <div v-for="(item,index) in list" :key="index" >
                <div class="_profile_card _dis_flex _box_shadow2 _border_radious _mr_b30 ">
                    <div class="_profile_card_pic">
                        <img  class="_profile_card_img" :src="item.image[0].imageUrl" alt="" title="">
                    </div>
                    <div class="_profile_card_name _flex_space _dis_flex">
                        <div class="Details_profie_rating">
                                <!-- <ul class="_1job_card_rating_ul">
                                    <li :class="(item.avgreview.averageRating>=1)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(item.avgreview.averageRating>=2)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(item.avgreview.averageRating>=3)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(item.avgreview.averageRating>=4)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li :class="(item.avgreview.averageRating>=5)? '_color' : ''"><i class="fas fa-star"></i></li>
                                    <li class="_1job_card_rating_num">({{item.reviews_count}})</li>
                                </ul> -->
                                <ul class="_1job_card_rating_ul"  >
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li ><i class="fas fa-star"></i></li>
									<li><i class="fas fa-star"></i></li>
									<li><i class="fas fa-star"></i></li>
									<li>(0)</li>
								</ul>
                            </div>
                        <div class="_profile_card_title _flex_space">
                                <p class="_profile_card_name_text_link"><router-link :to="{ name:'details', params:{ id:item.id }}" >{{item.title}}</router-link></p> 
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
