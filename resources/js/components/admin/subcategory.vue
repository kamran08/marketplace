<template>
    <div >
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-12 padd_top">
                    <div span="24" class="booked_date _border_radious _text_center _box_shadow2">
                        <div class="row">
                            <div class="col-md-12 category_list"  >
                                <Select v-model="formdata.category_id" placeholder="Select Category" >
                                    <Option v-for="(item,index) in list" :value="index" :key="index"  @click="changeIndex($event)" >{{ item.catName }}</Option>
                                </Select>
                            </div>
                            <div class="col-md-12 category_list"  >
                                <Input v-model="formdata.name" placeholder="Sub Catagory Name" />
                            </div>
                            <div class="col-md-12 category_list">
                                <button class="table_button_green" type="button" @click="addNewCatagory()">Add</button>
                            </div>
                        </div>
                    </div>
                        <!-- card -->

                    <div class="_profile_card_all list_head _box_shadow2 _border_radious _overflow" v-if="sublist.length"  >
                        <table class="table_C table-striped">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>Category</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody >
                            <tr v-for="(item,index) in sublist" :key="index">
                                <td>
                                    <span v-if="isEdit!=index" >{{item.name}}</span>
                                    <Input  v-if="isEdit==index" v-model="formdata.name" placeholder="Catagory Name" style="width: 150px" />
                                </td>
                                <td>
                                    <span v-if="isEdit!=index" >{{item.category.catName}}</span>
                                     <Select v-if="isEdit==index"  v-model="formdata.category_id" @change="changeIndex()">
                                        <Option v-for="(item,cindex) in list" :value="item.id" :key="cindex" >{{ item.catName }}</Option>
                                    </Select>
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
                    <div span="24" class="booked_date _text_center _box_shadow2" v-if="sublist.length==0" >
                        <h2>Loading...</h2>
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
            sublist:[],
            toDayDate:'',
            formdata:{
                name:'',
                category_id:'',
            },
            
            isEdit:-1,
            catIndex:'',
           

           
        }
    },
    methods:{
        
        async addNewCatagory(){
            let tempIndex = this.formdata.category_id
            this.formdata.category_id = this.list[tempIndex].id
            const res = await this.callApi('post', 'sub-category', this.formdata)
            if(res.status === 201){
                this.s('Sub Category Added');
                res.data.category = this.list[tempIndex]
                this.sublist.push(res.data);
                this.formdata.name=""
                this.formdata.category_id=""
            }
            else{
                this.swr()
            }
        },

        async getAllCatagory(){
            const res  = await  this.callApi('get','get-all-category');
            if(res.status===200){
                this.list = res.data
            }
            else{
                this.swr();
            }
        },
        async getAllSubCatagory(){
            const res  = await  this.callApi('get','sub-category');
            if(res.status===200){
                this.sublist = res.data
            }
            else{
                this.swr();
            }
        },
        editOn(index){
            this.formdata.name = this.sublist[index].name
            this.formdata.category_id = this.sublist[index].category_id
            this.isEdit  = index;
        },
        async deleteUser(index){
            if(!confirm("Are you sure to delete this Category")){
                return;
            }
            const res = await this.callApi('delete',"sub-category",{id:this.sublist[index].id})
            if(res.status==200){
                this.i("Sub Category has been  Deleted!")
                this.sublist.splice(index,1);
            }
            else{
                this.e();
            }
        },
        async Update(index){

            let listIndex = this.catIndex
            this.formdata.id = this.sublist[index].id

             const res = await this.callApi('put', 'sub-category', this.formdata)
            if(res.status === 200){
                this.s('Sub Category has been Updated');

                this.sublist[index].name = this.formdata.name
                this.sublist[index].category_id = this.formdata.category_id
                delete this.sublist[index].category
                this.sublist[index].category.catName = this.list[listIndex].catName

                this.isEdit = -1
                delete this.formdata.id
                this.formdata.name=""
                this.formdata.category_id=""
                this.catIndex = ''
            }
            else{
                this.swr()
            }
        },
        changeIndex(event){
            console.log(event.target.value);
           // this.catIndex = index; 

        }
    },
    created(){
        this.getAllCatagory();
        this.getAllSubCatagory();
    }
}
</script>

<style>

</style>
