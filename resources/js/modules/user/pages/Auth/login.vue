<template>
    <div>
     
     <div class="_login">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12 col-md-8 col-lg-4">
                        <div class="_login_main">
                            <div class="_login_header _bg _text_center">
                                <p class="_login_header_title"> SIGN IN </p>
                            </div>

                            <div class="_login_form">
                                <form v-on:submit.prevent="" >
                                    <div class="_login_input_group">
                                        <div class="_login_input">
                                            <div class="_login_input_inp">
                                                 <Input v-model="logdata.email" v-on:keyup.enter="check" placeholder="Email" type="email" required />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="_login_input_button" v-if="!status">
                                        <button class="_btn _login_input_button_btn _bg _email_signin_ICON" type="button" @click="check" > CONTINUE <i class="fas fa-chevron-right"></i></button>
                                    </div>
                                    <div class="this is for test " v-if="status">
                                    <div class="_login_input_group">
                                        <div class="_login_input">
                                            <div class="_login_input_inp">
                                                <Input v-model="logdata.password"  placeholder="Password" type="password" />
                                            </div>
                                        </div>
                                        
                                    </div>

                                    <div class="_login_input_button">
                                        <button class="_btn _login_input_button_btn _bg" type="submit" v-if="!load" @click="login(true)" name="submit">SIGN IN</button>
                                        <button class="_btn _login_input_button_btn _bg" type="submit" v-if="load" @click="login(false)" >loading.....</button>
                                        
                                    </div>
                                    
                                    </div>
                                    <p class="forget _text_right" @click="$router.push('/getEmail')" >Forget your password?</p>
                                </form>
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
        return {
            logdata: {
                email : '', 
                password: ''
            },
            status : false,
            load:false
        }
    },
     methods: {
        async login(e){
            
            
            if(this.logdata.email==='' || this.logdata.password===''){
                this.load = false
               return this.e('All fields are required')
            }
            this.load = e;
            const res = await this.callApi('post', 'login', this.logdata)
            if(res.status===200){
                 this.s('Login successfull!')
                 this.$store.dispatch('setAuth',res.data.user)
                  window.location='/'
            }else{
                if(res.status===401){
                    this.load = false
                    this.e(res.data.msg)
                }
            }
        },

      check(){
          console.log("call check");
          if(this.logdata.email===''){
              this.e('Email is empty!')
              return 
          }
          this.status = true
      }
        

    },
    
}
</script>

