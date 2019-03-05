<template>
    <div class="_login_input_group">
        <p class="_1steps_input_title" >EXTRA</p>
        <div class="_login_input" v-for="(item,index) in items" :key="index">
            <div class="_login_input_inp"  >
                <input class="_login_input_inp_field" v-model="item.serviceName" placeholder="title" type="text">
                <input class="_login_input_inp_field" v-model="item.servicePrice" placeholder="price" type="text">
                 <!-- <a id="thisok" class="remove-items mjob-remove-extra-item"><i class="fa fa-times"></i></a> -->
             <Button type="primary" @click="delate(index)"><i class="fas fa-times"></i></Button>
            </div>
        </div>
      
        
        <div v-if="ok">
        <input class="_login_input_inp_field" v-model="formdata.serviceName" placeholder="title" type="text">
        <input class="_login_input_inp_field" v-model="formdata.servicePrice" placeholder="price" type="text"> 
        <!-- <Button type="primary" @click="delate(-2)"><i class="fas fa-times"></i></Button> -->
       
        </div>  
        <Button @click="add"> add </Button>
        <Button @click="clear" v-if="ok"> clear</Button>
            <div class="_login_input_button">
                <button class="_btn _login_input_button_btn _bg" @click="join" type="button">Next</button>
                <!-- <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button> -->
            </div>
       
    
    </div>
</template>

<script>
export default {
    data(){
        return{
            formdata:{
                serviceName:'',
                servicePrice:'',
                service_id:1
            },
            items:[],
          itemName:'',
          itemPrice:'',
          ok:false,
          alljobs:'',
          visible: false,
          catagory:'catagory'

        }
    },
    created(){
            //this.formdata.service_id = this.getService_id
     },
    methods:{
       async delate(index){
           this.items.splice(index, 1);
           
        },
        
        join(){
            
            if(this.formdata.serviceName!='' && this.formdata.servicePrice!='' && this.formdata.service_id!=''){
                this.i('if you want to add current item please hit on add button or clear')

            }

            //this.items.push({serviceName:this.formdata.serviceName,servicePrice:this.formdata.servicePrice,service_id:this.formdata.service_id})
            else if(this.items.length>0){
                this.insertExtra(this.items);
                this.$store.dispatch('setTabInfo',4);
            }
              
        },
        add(){
            if(this.ok==1){
                if(this.formdata.serviceName=='' || this.formdata.servicePrice=='' ){
                    this.e('please fill all this item')
                    return;  
                }
                 else {
                    this.items.push({serviceName:this.formdata.serviceName,servicePrice:this.formdata.servicePrice,service_id:this.formdata.service_id})
                    this.formdata.serviceName=''
                    this.formdata.servicePrice=''
                    this.ok=false   
                    this.s('added a new extra service')
                 }
            }
            else{
                this.ok=true
            }
         },
        async insertExtra(data){
            const res = await this.callApi('post', 'add-extra', data)
            if(res.status===201){  
                this.s('your extra service has been added')
            }
            else{
                this.swr()
            }
        },
        async instantdata(){
                const res1 = await this.callApi('get', `intant-extra-data`)
        },
        clear(){
            this.formdata.serviceName = ''
            this.formdata.servicePrice = ''
        },
        
    },
    created(){
        this.i("Please click on add button , if you have additional services");
    },
   

}
</script>

<style>

</style>
