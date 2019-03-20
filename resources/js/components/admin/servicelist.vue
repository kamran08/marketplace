<template>
    <div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-9 padd_top" >
                    <div class="_profile_card_all" v-if="list.length" >
                        <!-- card -->
                        <div v-for="(item,index) in list" :key="index" >
                            <div class="_profile_card _dis_flex _box_shadow2 _border_radious _mr_b30 ">
                                <div class="_profile_card_pic">
                                    <img  class="_profile_card_img" :src="item.image[0].imageUrl" alt="" title="">
                                </div>
                                <div class="_profile_card_name _flex_space _dis_flex">
                                    <div class="Details_profie_rating">
                                            <ul class="_1job_card_rating_ul" v-if="item.reviews_count!=0" >
                                                <li :class="(item.avgreview.averageRating>=1)? '_color' : ''"><i class="fas fa-star"></i></li>
                                                <li :class="(item.avgreview.averageRating>=2)? '_color' : ''"><i class="fas fa-star"></i></li>
                                                <li :class="(item.avgreview.averageRating>=3)? '_color' : ''"><i class="fas fa-star"></i></li>
                                                <li :class="(item.avgreview.averageRating>=4)? '_color' : ''"><i class="fas fa-star"></i></li>
                                                <li :class="(item.avgreview.averageRating>=5)? '_color' : ''"><i class="fas fa-star"></i></li>
                                                <li class="_1job_card_rating_num">({{item.reviews_count}})</li>
                                            </ul>
                                            <ul class="_1job_card_rating_ul" v-if="item.reviews_count==0" >
                                                <li ><i class="fas fa-star"></i></li>
                                                <li ><i class="fas fa-star"></i></li>
                                                <li ><i class="fas fa-star"></i></li>
                                                <li ><i class="fas fa-star"></i></li>
                                                <li ><i class="fas fa-star"></i></li>
                                                <li class="_1job_card_rating_num">({{item.reviews_count}})</li>
                                            </ul>
                                        </div>
                                    <div class="_profile_card_title _flex_space">
                                            <p class="_profile_card_name_text_link"><router-link :to="{ name:'details', params:{ id:item.id }}" >{{item.title}}</router-link></p> 
                                    </div>
                                    <div class="_profile_card_title _flex_space">
                                        <p  class="_profile_card_name_text_link">User: <router-link :to="{ name:'bprofile'}" >{{item.user.name}}</router-link></p>
                                        <p  class="_profile_card_name_text_link">Extra Service : 
                                            <span v-if="item.extraService.length" v-for="(ex,k) in item.extraService" :key="k">
                                                {{ex.serviceName}}({{ex.servicePrice}}$), 
                                            </span>
                                            <span v-if="item.extraService" >
                                                No
                                            </span>

                                        </p>
                                    
                                    </div>
                                    <div class="_profile_card_title _flex_space">
                                        <button v-if="item.isApproved==0" class="table_button" type="button" @click="updateService(index)">Approve</button>
                                        <router-link :to="`/admin/editJobDescription/${item.id}`"><button  class="table_button_green" type="button" >Edit</button></router-link>
                                        <button class="table_button_red" type="button" @click="deleteService(index)">Delete</button>
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
                    <!-- card -->
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            toDayDate:'',
            user_id:this.$route.params.id,
        }
    },
    methods:{
        async getServiceList(){
            const res  = await  this.callApi('get',`getAllServiceList`)
            if(res.status===200){
                this.list = res.data
                
            }
            else{
                this.swr();
            }
        },
        async deleteService(index){
            if(!confirm("Are you sure to delete this Service")){
                return;
            }
            const res = await this.callApi('post',"deleteService",{id:this.list[index].id})
            if(res.status==200){
                this.i("User has been  Deleted!")
                
            }
            else{
                this.e();
            }
        },
        async updateService(index){
            let data={
                isApproved:1,
                id:this.list[index].id
            }
            const res = await this.callApi('post',"updateService",data)
            if(res.status==200){
                this.i("Service has been  Approved!")
                this.list.splice(index,1);
            }
            else{
                this.swr();
            }
        }
    },
    created(){
        this.getServiceList();
    }
}
</script>

<style>

</style>
