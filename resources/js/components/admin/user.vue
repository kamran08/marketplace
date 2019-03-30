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
                                    <button  v-if="item.id == authInfo.id" class="table_button" type="button" @click=" sPassword = true" >Change Password</button>
                                    <button  v-if="item.id == authInfo.id"  class="table_button" type="button" @click=" sEmail  = true" >Change Email</button>
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
        <Modal class="product_image" v-model="sPassword" width="600">
                <Row >
                    <Col span="12" offset="8">
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                      <h3>Change Password</h3>
                                </div>
                            </div>
                        </div>
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                     <Input v-model="password.oldPassword"  placeholder="Enter your old password" type="password"/>
                                </div>
                            </div>
                        </div>
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                     <Input v-model="password.newPassword"  placeholder="Enter your new password" type="password"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                    <Input v-model="password.confirm_password" placeholder="Confirm your new password" type="password" />
                                </div>
                            </div>
                        </div>
                    </Col>
                </Row>
                <div slot="footer">
                    <Button type="info" @click="passwordUpdate">Update password</Button>
                    <Button  @click="sPassword=false">Cancle</Button>
                </div>
        </Modal>
        <Modal class="product_image" v-model="sEmail" width="600">
                <Row >
                     <Col span="12" offset="8">
                       
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                      <h3>Change Email</h3>
                                </div>
                            </div>
                        </div>
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                     <Input v-model="email.oldEmail"  placeholder="Enter your old email" type="email"/>
                                </div>
                            </div>
                        </div>
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                     <Input v-model="email.newEmail"  placeholder="Enter your new email" type="email"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                    <Input v-model="email.password" placeholder="Enter your password" type="password" />
                                </div>
                            </div>
                        </div>
                    </Col>
                </Row>
                <div slot="footer">
                   <Button type="info" @click="updateEmail">Update Email</Button>
                    <Button  @click="sEmail=false">Cancle</Button>
                </div>
        </Modal>
    </div>
</template>

<script>
export default {
    data(){
        return{
            list:[],
            toDayDate:'',
            isloading:true,
            sEmail:false,
            sPassword:false,
            email:{
                oldEmail:'',
                newEmail:'',
                password:'',
                id:'',
                type:'',
            },
            password:{
                oldPassword:'',
                newPassword:'',
                confirm_password:'',
                id:'',
                type:'',
            }
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
        },
         async updateEmail(){
             if(this.email.oldEmail == '' || this.email.newEmail == '' || this.email.password == ''){
                this.i("All fields are required!")
                return;
            }
            this.email.id = this.authInfo.id;
            this.email.type = 'email';
            const res = await this.callApi('post','updateUserSettings',this.email)
            if(res.status===200){
                this.s("Email updated!")
                this.s("Please sign in with your new Email!")
                setTimeout(()=>{
                    window.location='/logout'
                },2000)
               
                this.sEmail = false
            }
            else if(res.status===401){
                this.e(res.data.message);

            }
            else{
                this.swr();
            }
            
          
        },
        async passwordUpdate(){
            if(this.password.oldPassword == '' || this.password.newPassword == ''){ 
                this.i("All fields are required!")
                return;
            }
            if(this.password.newPassword != this.password.confirm_password){
                this.i("Password doesn't match!")
                return;
            }
            this.password.id = this.authInfo.id;
            this.password.type = 'password';
            const res = await this.callApi('post','updateUserSettings',this.password)
            if(res.status === 200){
                this.s("Passwrord updated!")
                
                this.sPassword = false
                this.clearData;
            }
            else if(res.status===401){
                this.e(res.data.message);

            }
            else{
                this.swr();
            }
            
          
        },
        clearData(){
            
                email.oldEmail= ''
                email.newEmail= ''
                email.password= ''
                email.id= ''
                email.type= ''
            
            
                password.oldPassword=''
                password.newPassword=''
                password.confirm_password =''
                password.id= ''
                password.type= ''
            
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
