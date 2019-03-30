<template>
    <div >
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-12 padd_top">
                    <div span="24" class="booked_date _border_radious _text_center _box_shadow2">
                        <div class="row">
                            <div class="col-md-12 category_phone"  >
                                <Input v-model="formdata.catName" placeholder="Catagory Name" />
                            </div>
                            <div class="col-md-12" style=" min-height: 50px; " >
                                <Upload
                                ref="upload"
                                type="drag"
                                name="img"
                                v-if="!formdata.image"
                                :with-credentials="true"
                                :headers="crfObj"
                                :on-success="handleSuccess"
                                :format="['jpg','jpeg','png']"
                                :max-size="2048"
                                action="/app/getServiceImage">
                                <div style="padding: 20px 0">
                                    <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                                    <p>Click or drag photo here to upload</p>
                                </div>
                                </Upload>
                                <img   v-if="formdata.image" class="_1steps_img_pic" :src="formdata.image"  title="">
                            </div>
                            <div class="col-md-12">
                                <button class="table_button_green" type="button" @click="addNewCatagory()">Add</button>
                            </div>
                        </div>
                    

                        
                        
                        
                    </div>
                        <!-- card -->

                    <div class="_profile_card_all list_head _box_shadow2 _border_radious _overflow" v-if="list.length && isloading"  >
                        <table class="table_C table-striped">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>photo link</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody >
                            <tr v-for="(item,index) in list" :key="index">
                                <td>
                                    <span v-if="isEdit!=index" >{{item.catName}}</span>
                                    <Input  v-if="isEdit==index" v-model="formdata.catName" placeholder="Catagory Name" style="width: 150px" />
                                </td>
                                <!-- <td>{{item.userType | userTypeName}}</td> -->
                                <td>
                                    <button v-if="isEdit!=index" class="table_button_green" type="button" @click="ImageModalOn(item.image)" >Image</button>
                                    <button v-if="isEdit==index" class="table_button" type="button" @click="imageModalUpload=true" >Upload Image</button>
                                </td>
                                <td>
                                    <button  v-if="isEdit!=index" class="table_button" type="button" @click="editOn(index)" >Edit</button>
                                    <button  v-if="isEdit==index" class="table_button_green" type="button" @click="Update(index)" >Update</button>
                                    <button  v-if="isEdit==index" class="table_button" type="button" @click="isEdit=-1" >Cancle</button>
                                    <button class="table_button_red" type="button" @click="deleteUser(index)">Delete</button>
                                </td>

                            </tr>
                        
                            </tbody>

                        </table>
                    </div>
                 
                    <div span="14" class="booked_date _text_center _box_shadow2 _border_radious"  v-if="!isloading" >
                        <h2>Loading .....</h2>
                    </div>
                    <!-- card -->
                    <Modal class="product_image" v-model="imageModal" width="900">
                        <p slot="header" style="color:#19be6b;text-align:center">
                            <span>Image </span>
                        </p>
                        
                        <div class="product_image_main">
                            <img class="product_image_main_img" v-if="imageUrl" :src="imageUrl" >
                        </div>

                        <div slot="footer">
                            <Button type="success" @click="imageModal=false" >Close</Button>
                        </div>
                </Modal>
                    <Modal class="product_image" v-model="imageModalUpload" width="900">
                        <Upload
                            ref="upload"
                                type="drag"
                                name="img"
                                v-if="!formdata.image"
                                :with-credentials="true"
                                :headers="crfObj"
                                :on-success="handleSuccess"
                                :format="['jpg','jpeg','png']"
                                :max-size="2048"
                                action="/app/getServiceImage">
                            
                            <div style="padding: 20px 0">
                                <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                                <p>Click or drag files here to upload</p>
                            </div>
                        </Upload>

                        <div slot="footer">
                            <Button type="success" @click="imageModal=false" >Close</Button>
                        </div>
                </Modal>
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
                catName:'',
                image:'',
            },
            crfObj: {
                    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            imageModal:false,
            imageModalUpload:false,
            imageUrl:'',
            isEdit:-1,
            isloading:true,
        }
    },
    methods:{
        ImageModalOn(i){
            this.imageUrl = i
            this.imageModal = true;
        },
        async addNewCatagory(){
            if( this.formdata.catName == ''){
                this.i("Category name is required!");
                return;
            }
            if( this.formdata.image == ''){
                this.i("Category image is required!");
                return;
            }


            const res = await this.callApi('post', 'insert-catagory', this.formdata)
            if(res.status === 201){
                this.s('Category Added');
                this.list.push(res.data);
                this.formdata.catName=""
                this.formdata.image=""
            }
            else{
                this.swr()
            }
        },

        async getAllCatagory(){
            this.isloading = false
            const res  = await  this.callApi('get','get-all-catgory');
            if(res.status===200){
                this.list = res.data
                this.isloading = true
                console.log(res.data)
               
            }
            else{
                this.swr();
                this.isloading = true
            }
        },
        editOn(index){
            
            this.formdata.catName = this.list[index].catName
            this.isEdit  = index;

        },
        handleSuccess(res, file){
             this.formdata.image = res;
             this.imageModalUpload = false;
        },
        async updateStatus(status,index){
            if(status == 0){
                this.list.isTrue = false
            }
            else{

                const res = await this.callApi('post',"updateUser",{id:this.list[index].id})
                if(res.status==200){
                if(status==1){
                    this.s("catagory has been Updated!")
                }
               
                    this.list[index].isActive = true
                }
               else{
                this.swr()();
               }
            }
      
        },
        async deleteUser(index){
            if(!confirm("Are you sure to delete this Category")){
                return;
            }
            const res = await this.callApi('post',"deleteCategory",{id:this.list[index].id})
            if(res.status==200){
                this.i("Category has been  Deleted!")
                this.list.splice(index,1);
               
            }
            else{
                this.e();
            }
        },
        async Update(index){
             this.formdata.id = this.list[index].id
             let editData = {
                 id : this.list[index].id
             }
             if(this.formdata.catName != '') editData.catname = this.formdata.catName
             if(this.formdata.image != '') editData.image = this.formdata.image
             const res = await this.callApi('post', 'categoryUpdate', editData)
            if(res.status === 200){
                this.s('Category has been Updated');
                if(this.formdata.catName != '') this.list[index].catname = this.formdata.catName
                if(this.formdata.image != '') this.list[index].image = this.formdata.image
                this.isEdit = -1
                delete this.formdata.id
                this.formdata.catName=""
                this.formdata.image=""
            }
            else{
                this.swr()
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
        this.getAllCatagory();
        for(let item of this.list){
            item.list.isTrue = true;
        }
    }
}
</script>

<style>

</style>
