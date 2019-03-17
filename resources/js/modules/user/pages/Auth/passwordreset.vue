<template>
    <div>
     <div class="_login">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-12 col-md-4 _login_main">
					<div class="_login_header _bg _text_center">
						<p class="_login_header_title"> Password Reset </p>
					</div>
					<div class="_login_form">
						<div class="_login_input_group">
							<div class="_login_input_group">
									<div class="_login_input">
										<i class="fas fa-lock"></i>
										<div class="_login_input_inp">
											<input class="_login_input_inp_field" v-model="formData.password" placeholder="Password" type="password" required>
										</div>
									</div>
								</div>
							<div class="_login_input_group">
									<div class="_login_input">
										<i class="fas fa-lock"></i>
										<div class="_login_input_inp">
											<input class="_login_input_inp_field" v-model="formData.password_confirmation" placeholder="Confrim Password" type="password" required>
										</div>
									</div>
								</div>
						</div>
						<div class="_login_input_button">
							<button class="_btn _login_input_button_btn _bg" type="submit" @click="resetPassword" name="submit">Update Password</button>
						</div>
                        </div>
					</div>
				</div>
			</div>
		</div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            formData:{
                email:"",
                password:'',
                password_confirmation:'',
            },
            status:false,
        }
    },
    methods:{

        async resetPassword(){
            if(this.formData.password=="" || this.formData.password_confirmation==''){
                this.i("All frields are required!");
                return;
            }
            const res = await this.callApi('post','resetPassword',this.formData)
            if(res.status===200){
                this.s("Your Password has been reset . Please Login with your new password!")
                this.$router.push('/login');
            }
            else if(res.status===422){
                if(res.data.errors.password)
                {
                    for(let e of res.data.errors.password  )
                        this.e(e);
                }  
            }
            else if (res.status===401){
                this.s(res.data.msg);
            }
            else {
                this.swr();
            }
        },
        async tokenVarification(token){
            const res = await this.callApi('post','matchPasswordLink',{token:token})
            if(res.status===200){
               this.status = true;
               console.log(this.status);
               console.log(res.data)
               this.formData.email = res.data.token.email

            }
            else if (res.status ===401){
        
                this.e(res.data.msg);
                 this.$router.push("/")
            }
            else{
                this.swr();
                 this.$router.push("/")
            }
        }
    },
    created(){
        let token = this.$route.query.token
        if(!token){
            this.$router.push("/")
        }
        this.tokenVarification(token);

        
    },

}
</script>

<style>

</style>
