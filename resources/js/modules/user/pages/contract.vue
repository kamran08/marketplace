<template>
    <div>
     
     <div class="_login">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12 col-md-8 col-lg-8">
                        <div class="_login_main">
                            <div class="_login_header _bg _text_center">
                                <p class="_login_header_title"> Contact Us </p>
                            </div>

                            <div class="_login_form">
                                <div class="row">
                                    <div class="col-12 col-md-6">
                                        <div class="_login_input_group">
                                            <div class="_login_input">
                                                <div class="_login_input_inp">
                                                    <Input placeholder="Name" type="text" v-model="data.name"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                     <div class="col-12 col-md-6">
                                        <div class="_login_input_group">
                                            <div class="_login_input">
                                                <div class="_login_input_inp">
                                                    <Input placeholder="Email" type="email" v-model="data.email"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                     <div class="col-12 col-md-12">
                                        <div class="_login_input_group">
                                            <div class="_login_input">
                                                <div class="_login_input_inp">
                                                    <Input placeholder="Write something" type="textarea" :rows="4" v-model="data.message"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12 col-md-12">
                                        <div class="_login_input_button">
                                            <button class="_btn _login_input_button_btn _bg _email_signin_ICON" type="button"  @click="send"> CONTINUE <i class="fas fa-chevron-right"></i></button>
                                        </div>
                                    </div>
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
            data:{
                name:'',
                email:'',
                message:''
            }
        }
    },
    methods:{
        async send(){
            if(this.data.name=='' || this.data.email == '' || this.data.message=='') {
                this.i('please filled the all field')
                return
            }
            const res = await this.callApi('post', 'contractMessage', this.data)
            if(res.status === 200){
                this.s('Your message has been sent successgfully!. Thank you.')
                this.data = {}
            }
            else{
                this.swr()
            }
        }
    }
    
}
</script>


