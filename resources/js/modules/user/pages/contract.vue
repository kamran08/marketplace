<template>
    <div>
         <div class="contract_admin">
            <div class="form-group">
                <p class=" msg_box_header">Your Name</p>
                <input type="text"  placeholder="name" class="input_input" v-model="formdata.name">
                <p class=" msg_box_header">Your Email</p>
                <input type="text"  placeholder="email" class="input_input" v-model="formdata.email">
                <p class=" msg_box_header">Your Message</p>
                <textarea placeholder="Write your message..." class="form-control msg_box input_input"  rows="3" v-model="formdata.message"></textarea>
                <div class="btn_center"> <button class="_btn_" @click="send">send</button></div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            formdata:{
                name:'',
                email:'',
                message:''
            }
        }
    },
    methods:{
        async send(){
            if(this.formdata.name=='' || this.formdata.email == '' || this.formdata.message=='') {
                this.i('please filled the all field')
                return
            }
            const res = await this.callApi('post', 'contractMessage', this.formdata)
            if(res.status === 200){
                this.s()
            }
            else{
                this.swr()
            }
        }
    }
    
}
</script>


