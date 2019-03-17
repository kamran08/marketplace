<template>
    <div>
     <div class="_login">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-12 col-md-4 _login_main">
					<div class="_login_header _bg _text_center">
						<p class="_login_header_title"> Enter You Email </p>
					</div>
					<div class="_login_form">
						<div class="_login_input_group">
							<div class="_login_input">
								<i class="fas fa-user"></i>
								<div class="_login_input_inp">
									<input class="_login_input_inp_field" v-model="formData.email" v-on:keyup.enter="check" placeholder="Email" type="email" required>
								</div>
							</div>
						</div>
						<div class="_login_input_button">
							<button class="_btn _login_input_button_btn _bg" type="submit" @click="resetPassword" name="submit">Send reset link</button>
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
            formData:{
                email:'',
            },
        }
    },
     methods: {
        async resetPassword(){
            if(this.formData.email==""){
                this.i("All frields are required!");
                return;
            }
            const res = await this.callApi('post','passwordresetGetEmail',this.formData)
            if(res.status===200){
               this.s("Password reset link has been sent to Your Email Address !");
               this.$router.push("/login")
            }
            else if (res.status===401){
                this.e(res.data.msg);
            }
            else {
                this.swr();
            }
        },


        

    },
    
}
</script>

