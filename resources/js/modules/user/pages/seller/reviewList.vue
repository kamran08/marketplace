<template>
    <div class="_box_shadow2 pro_menu _border_radious">
        <p class="_comment_title">REVIEWS <span class="_comment_title_span">({{list.length}})</span></p> 
        <div class="_commnet_all" v-if="list.length!=0" >
                <!-- items --> 
            <div class="_commnet_main _b_color2 _dis_flex" v-for="(item,index) in list" :key="index" >
                <div class="_commnet_img">
                    <img class="_commnet_img_pic" :src="(item.user.image)? item.user.image : defultImage" alt="" title="">
                </div>
                <div class="_commnet_status_name _flex_space">
                    <div class="_commnet_name _dis_flex">
                        <div class="_commnet_name_title _flex_space">
                            <p class="_commnet_pro_name">{{item.user.name}}</p>
                            <p class="_commnet_pro_date">{{item.created_at}}</p>
                        </div>
                        <ul class="_1job_card_rating_ul">
                            <li :class="(item.rating>=1)? '_color' : ''"><i class="fas fa-star"></i></li>
                            <li :class="(item.rating>=2)? '_color' : ''"><i class="fas fa-star"></i></li>
                            <li :class="(item.rating>=3)? '_color' : ''"><i class="fas fa-star"></i></li>
                            <li :class="(item.rating>=4)? '_color' : ''"><i class="fas fa-star"></i></li>
                            <li :class="(item.rating>=5)? '_color' : ''"><i class="fas fa-star"></i></li>
                        </ul>
                    </div>
                    <div class="_commnet_status">
                        <p class="_commnet_status_text"> {{item.comment}}</p>
                    </div>
                </div>
            </div>
                <!-- items -->
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            user_id:this.$route.params.id,
        }
    },
    methods:{
        async getRiviewList(){
            this.isloading = false
            const res  = await  this.callApi('get',`getRiviewListById/${this.user_id}`)
            
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

        this.getRiviewList();
    }
}
</script>

<style>

</style>
