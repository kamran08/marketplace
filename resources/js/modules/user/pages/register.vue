<template>
    <div>

        <div class="_login">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-12 col-md-5">
						<div class="_login_main">
							<div class="_login_header _bg _text_center">
								<p class="_login_header_title"> REGISTRATION </p>
							</div>

							<div class="_login_form">
								<form>
									<div class="_login_input_group">
										<h3 class="_register_title">SUCCESSFUL PAYMENT</h3>

										<p class="_email_signin_text">Explre thousands of micro jobs everyday </br>
										 Do what you love and love what you do!</p>
									</div>

									<div class="_login_input_group">
										<div class="_login_input">
											<i class="fas fa-envelope"></i>

											<div class="_login_input_inp">
                                                <input class="_login_input_inp_field" v-model="regesterData.email" placeholder="Email" type="email" required>
												<!-- <input class="_login_input_inp_field" placeholder="Username" type="text"> -->
											</div>
										</div>
									</div>

									<div class="_login_input_group">
										<div class="_login_input">
											<i class="fas fa-user"></i>

											<div class="_login_input_inp">
												<!-- <input class="_login_input_inp_field" placeholder="Username" type="text"> -->
                                                <input class="_login_input_inp_field" v-model="regesterData.userName" placeholder="Username" type="text" required>
											</div>
										</div>
									</div>

									<div class="_login_input_group">
										<div class="_login_input">
											<i class="fas fa-lock"></i>

											<div class="_login_input_inp">
												<input class="_login_input_inp_field" v-model="regesterData.password" placeholder="Password" type="password" required>
											</div>
										</div>
									</div>

									<div class="_login_input_group">
										<div class="_login_input">
											<i class="fas fa-lock"></i>

											<div class="_login_input_inp">
												<input class="_login_input_inp_field" v-model="confirmPassword" placeholder="Confirm your password" type="password" required>
											</div>
										</div>
									</div>

									<div class="_login_input_group">
										<div class="_login_input">
											<input class="_register_agree_radio" type="radio" name="gender" value="male">

											<p class="_register_agree">I agree to all the <span class="_register_agree_span">terms and conditions.</span></p>
										</div>
									</div>

									<div class="_login_input_button">
										<button class="_btn _login_input_button_btn _bg" @click="registerUser" type="button">JOIN NOW</button>
									</div>
								</form>

								<div class="_other_signin">
									<ul class="_other_signin_ul">
										<li class="_or_sign">Or sign in with</li>
										<li class="_linkedin"><i class="fab fa-linkedin-in"></i></li>
										<li class="_facebook"><i class="fab fa-facebook-f"></i></li>
										<li class="_twitter"><i class="fab fa-twitter"></i></li>
									</ul>
								</div>
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
                regesterData:{
                        email:'',
                        userName:'',
                        password:'',
                        userType:'',

                },
                confirmPassword:'',
            }
        },
        created(){
			this.userType = this.getUserTyper
			console.log(this.userType)
        },
        mounted(){

        },
        methods:{
               async registerUser(){
                       if(this.regesterData.email==='' || this.regesterData.password==='' || this.regesterData.userName===''){
                           return this.e('All fields are required')
                        }
					 if(this.regesterData.password !== this.confirmPassword) this.e('password does not match')
					 
					 else{
						 
						const res = await this.callApi('post', 'register', this.regesterData)
						
     				 if(res.status===200){
                        this.s('Registeration successfully!')
                        this.$store.dispatch('setAuth',res.data.user)
                        this.$router.push('/');
                      
                    }else{
                        if(res.status===422){
                            // this.isLoading = false
							// this.text = 'LOGIN'
							if(res.data.errors.email)
							this.e(res.data.errors.email)
							if(res.data.errors.password)
                            this.e(res.data.errors.password)
                           
                        }
					}
					 }
					 
                 
                }


        }


            
}            
</script>
