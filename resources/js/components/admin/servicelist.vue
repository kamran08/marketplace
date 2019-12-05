<template>
    <div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-12 padd_top" >
                    <div class="_profile_card_all" v-if="list.length && isloading" >
                        <!-- card -->
                    <div class="_profile_card_all list_head _box_shadow2 _border_radious _overflow" v-if="list.length && isloading"  >
                        <table class="table_C table-striped">
                            <thead>
                            <tr>
                                <th>Title</th>
                                <th>Service-Provider</th>
                                <th>Extra</th>
                                <th>Price</th>
                                <th>Completed</th>
                                <th>Step Completed</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody >
                            <tr v-for="(item,index) in list" :key="index" >
                                <td>
                                    {{item.title}}
                                </td>
                                <td>{{item.user.name}}</td>
                                <td>
                                    {{item.extra.length}}
                                </td>
                                <td>{{item.price}}</td>
                                <td>{{(item.isComplete == 0)? "No" : "Yes"}}</td>
                                <td>{{item.nextStep-1}}</td>
                                <td>
                                    <button v-if="item.isFeatured==0" class="table_button" type="button" @click="updateServiceFeatured(item)">Make It Featured</button>
                                    <button v-if="item.isFeatured==1" class="table_button" type="button" @click="updateServiceFeatured(item)">Make It Unfeatured</button>
                                    <button v-if="item.isApproved==0" class="table_button" type="button" @click="updateService(index)">Approve</button>
                                    <router-link :to="`/admin/editJobDescription/${item.id}`"><button  class="table_button_green" type="button" >Edit</button></router-link>
                                    <button class="table_button_red" type="button" @click="deleteService(index)">Delete</button>
                                </td>

                            </tr>
                            </tbody>
                        </table>
                    </div>
                        <!-- <div v-for="(item,index) in list" :key="index" >
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
                                        
                                    </div>
                                    <div class="_dis_flex _profile_card_doller">
                                        <div class="_1job_card_dollar">
                                            <p class="_1job_card_dollar_text _color"> {{item.price}}</p>
                                            <p class="_1job_card_dollar_sine _color">$</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <div span="14" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
                        <h2>Loading .....</h2>
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
            isloading:true
        }
    },
    methods:{
        async getServiceList(){
            this.isloading = false
            const res  = await  this.callApi('get',`getAllServiceList`)
            if(res.status===200){
                this.list = res.data
                this.isloading = true
            }
            else{
                this.swr();
                this.isloading = true
            }
        },
        async deleteService(index){
            if(!confirm("Are you sure to delete this Service")){
                return;
            }

            const res = await this.callApi('post',"deleteService",{id:this.list[index].id})
            if(res.status==200){
                this.i("Service has been  Deleted!")
                this.list.splice(index,1);
                
            }
            else{
                this.swr();
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
        },
        async updateServiceFeatured(item,index){
            item.isFeatured = !item.isFeatured
            let data={
                isFeatured:item.isFeatured,
                id:item.id
            }
            
            const res = await this.callApi('post',"updateService",data)
            if(res.status==200){
                this.i("Service has been  Updated!")
                // this.list.splice(index,1);
            }
            else{
                this.swr();
            }
        },
    },
    created(){
        this.getServiceList();
    }
}
</script>

<style>

</style>
