<template>
    <div >
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-12 padd_top">
                    <div span="24" class="booked_date _border_radious _text_center _box_shadow2">
                        <div class="row">
                            <div class="col-md-12 category_phone"  >
                                <Input v-model="formdata.location" placeholder="Location Name" />
                            </div>
                          
                            <div class="col-md-12">
                                <button class="table_button_green" type="button" @click="addnewLocation()">Add</button>
                            </div>
                        </div>
                    

                        
                        
                        
                    </div>
                        <!-- card -->

                    <div class="_profile_card_all list_head _box_shadow2 _border_radious _overflow" v-if="list.length && isloading"  >
                        <table class="table_C table-striped">
                            <thead>
                            <tr>
                                <th style="text-align:center">Location Name</th>
                                <th style="text-align:center">Action</th>
                            </tr>
                            </thead>
                            <tbody >
                            <tr v-for="(item,index) in list" :key="index">
                                <td>
                                    <span v-if="isEdit!=index" >{{item.location}}</span>
                                    <Input  v-if="isEdit==index" v-model="editData.location" placeholder="Catagory Name" style="width: 150px" />
                                </td>
                                <!-- <td>{{item.userType | userTypeName}}</td> -->
                              
                                <td>
                                    <button  v-if="isEdit!=index" class="table_button" type="button" @click="editOn(index)" >Edit</button>
                                    <button  v-if="isEdit==index" class="table_button_green" type="button" @click="Update(index)" >Update</button>
                                    <button  v-if="isEdit==index" class="table_button" type="button" @click="isEdit=-1" >Cancle</button>
                                    <button class="table_button_red" type="button" @click="deleteLocation(index)">Delete</button>
                                </td>

                            </tr>
                        
                            </tbody>

                        </table>
                    </div>
                 
                    <div span="14" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
                        <h2>Loading .....</h2>
                    </div>
                    <div span="14" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="isloading && !list.length" >
                        <h2> No Data found .....</h2>
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
            formdata:{
                location:'',
            },
            editData:{
                location:''
            },
            
            isEdit:-1,
            isloading:true,
        }
    },
    methods:{
 
        async addnewLocation(){
            if( this.formdata.location == ''){
                this.i("location name is required!");
                return;
            }
            const res = await this.callApi('post', 'location', this.formdata)
            if(res.status === 201){
                this.s('Location Added');
                this.list.unshift(res.data)
                this.formdata.location=""
            }
            else{
                this.swr()
            }
        },

        async getAllLocations(){
            this.isloading = false
            const res  = await  this.callApi('get','location');
            if(res.status===200){
                this.list = res.data
                this.isloading = true
               
            }
            else{
                this.swr();
                this.isloading = true
            }
        },
        editOn(index){
            
            this.editData.location = this.list[index].location
            this.isEdit  = index;

        },
        async deleteLocation(index){
            if(!confirm("Are you sure to delete this Location")){
                return;
            }
            const res = await this.callApi('delete',"location",{id:this.list[index].id})
            if(res.status==200){
                this.i("Location has been  Deleted!")
                this.list.splice(index,1);
               
            }
            else{
                this.e();
            }
        },
        async Update(index){
             this.editData.id = this.list[index].id
             if(this.editData.location==''){
                 return this.i('location name can not be empty!!')
             }
             const res = await this.callApi('put',"location", this.editData)
            if(res.status === 200){
                this.s('Location has been Updated');
                this.list[index].location = this.editData.location
                this.editData.location = ''
                this.isEdit = -1
            }
            else{
                this.swr()
            }
        }
    },
    
    created(){
        this.getAllLocations();
       
    }
}
</script>

<style>

</style>
