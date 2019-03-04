<template>
    <div>
     <headsSction />
     <div class="_login">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12 col-md-4 _login_main">
						<div class="_login_header _bg _text_center">
							<p class="_login_header_title"> SIGN IN </p>
						</div>

						<div class="_login_form">
							<form>
								<div class="_login_input_group">
									<div class="_login_input">
										<i class="fas fa-user"></i>

										<div class="_login_input_inp">
											<input class="_login_input_inp_field" v-model="logdata.email" placeholder="Email" type="email" required>
										</div>
									</div>
								</div>
                                <div class="_login_input_button" v-if="notok">
									<button class="_btn _login_input_button_btn _bg _email_signin_ICON" type="button" @click="check" > CONTINUE <i class="fas fa-chevron-right"></i></button>
								</div>
                                <div class="this is for test " v-if="ok">
								<div class="_login_input_group">
									<div class="_login_input">
										<i class="fas fa-lock"></i>

										<div class="_login_input_inp">
											<input class="_login_input_inp_field" v-model="logdata.password" placeholder="Password" type="password">
										</div>
									</div>
									<p class="forget _text_right">Forget your password?</p>
								</div>

								<div class="_login_input_button">
									<button class="_btn _login_input_button_btn _bg" @click='login' type="button">SIGN IN</button>
								</div>
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
</template>

<script>
import headsSction from '../../../components/pages/header.vue'
export default {
    components:{
        headsSction
    },
    data(){
        return {
            logdata: {
                email : '', 
                password: ''
            },
            notok:true,
            ok:false,
        }
       
    },
     methods: {
        //    logout(){
        //     console.log("i am logout")
        //     this.setAuth([]);
        // },
        async login(){
            console.log('falstu')
            if(this.logdata.email==='' || this.logdata.password===''){
               return this.e('All fields are required')
            }
            const res = await this.callApi('post', 'login', this.logdata)
            if(res.status===200){
                 this.s('Loggedin successfully!')
                 this.$store.dispatch('setAuth',res.data.user)
                this.$router.push('/');
            }else{
                if(res.status===401){
                    this.e(res.data.msg)
                }
            }
        },

      check(){
          if(this.logdata.email==='')
          return this.e('All fields are required')
          else{
            this.notok = false;
            this.ok = true;
          }
      
      }
        

    },
    
}
</script>

