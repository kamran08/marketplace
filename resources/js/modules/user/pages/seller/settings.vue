<template>
    <div class="_comment">
       
                <!-- items --> 
                <Row v-if="sMenu">
                    <Col span="12" offset="8">
                        <Button class="btn btn-info" @click="show(1)" >Change Email</Button>
                        <Button  @click="show(2)"  >Change Password</Button>
                    </Col>
                </Row>
                <Row v-if="sEmail">
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
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                    <Button type="info" @click="updateEmail">Update Email</Button>
                                    <Button  @click="cancle">Cancle</Button>
                                </div>
                            </div>
                        </div>
                        
                    </Col>
                    
                </Row>
                <Row v-if="sPassword">
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
                        <div class="_login_input_group">
                            <div class="_login_input">
                                <div class="_login_input_inp">
                                    <Button type="info" @click="passwordUpdate"  >Update password</Button>
                                    <Button  @click="cancle">Cancle</Button>
                                </div>
                            </div>
                        </div>
                    </Col>
                </Row>
                

                
                
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
            sMenu:true,
            sEmail:false,
            sPassword:false,
            email:{
                oldEmail:'',
                newEmail:'',
                password:'',
            },
            password:{
                oldPassword:'',
                newPassword:'',
                confirm_password:'',
            }
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
        show(flag){
            this.sMenu = false
            if(flag==1) this.sEmail = true
            else this.sPassword = true
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
                this.sMenu = true
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
                this.sMenu = true
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
        cancle(){
            this.sMenu =true
            this.sEmail =false
            this.sPassword =false
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
    created(){

        this.getRiviewList();
    }
}
</script>

<style>

</style>
