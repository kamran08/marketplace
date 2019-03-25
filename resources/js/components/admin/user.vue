<template>
    <div >
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-12 padd_top">
                    <!-- card -->
                    <div class="_profile_card_all list_head _overflow _box_shadow2 _border_radious" v-if="list.length && isloading"  >
                        <table class="table_C table-striped">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>UserType</th>
                                <th>Email</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="(item,index) in list" :key="index">
                                <td>{{item.name}}</td>
                                <td>{{item.userType | userTypeName}}</td>
                                <td>{{item.email}}</td>
                                <td>
                                    <!-- <button class="table_button" type="button" @click="updateStatus(1,index)" >Edit</button> -->
                                    <button v-if="item.isActive==0"  class="table_button_green" type="button" @click="updateStatus(1,index)" >Activated</button>
                                    <button  v-if="item.isActive==1"  class="table_button" type="button" @click="updateStatus(0,index)" >Deactivated</button>
                                    <button class="table_button_red" type="button" @click="deleteUser(index)">Delete</button>
                                </td>

                            </tr>
                        
                            </tbody>
                        </table>
                    </div>

                    <div span="24" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="list.length==0" >
                        <h2>No Canceled Bookings This Day</h2>
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
            isloading:true
        }
    },
    methods:{
        async getAllUserList(){
            this.isloading = false;
            const res  = await  this.callApi('get',`getAllUserList`);
            if(res.status===200){
                this.list = res.data
                this.isloading = true
            }
            else{
                this.swr();
                this.isloading = true
            }
        },
        async updateStatus(status,index){
            const res = await this.callApi('post',"updateUser",{isActive:status,id:this.list[index].id})
            if(res.status==200){
               if(status==1){
                   this.s("User has been  Activated!")
               }
               else{
                   this.i("User has been  Deactivated!")
               }

               this.list[index].isActive = status
            }
            else{
                this.e();
            }
        },
        async deleteUser(index){
            if(!confirm("Are you sure to delete this user")){
                return;
            }
            const res = await this.callApi('post',"deleteUser",{id:this.list[index].id})
            if(res.status==200){
                this.i("User has been  Deleted!")
                this.list.splice(index,1);
               
            }
            else{
                this.e();
            }
        }
    },
    filters:{
        userTypeName(type){
            if(type == 1)
                return "Seller";
            else if(type == 2)
                return "Buyer";
            else if(type == 4)
                return "Admin";
        },
    },
    created(){
        this.getAllUserList();
    }
}
</script>

<style>

</style>
