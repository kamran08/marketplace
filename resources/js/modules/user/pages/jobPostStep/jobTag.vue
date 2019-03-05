<template>
    <div class="_login_input_group">
        <p class="_1steps_input_title">TAGS</p>
        <div class="_login_input">
            <div class="_login_input_inp">
                <!-- <input class="_login_input_inp_field" v-model="formdata.tagName" placeholder="Tag" type="text"> -->
                    <Input class="_login_input_inp_field" type="text"  ref = "input"  placeholder="Tag" v-model="tagName" @keyup.enter.native="add()"/>
            </div>
        </div>
        <div v-for="(item,i) in items" :key="i" v-if="items.length>0" > 
           
            {{item.tagName}} <i class="fa fa-times" @click="delate(i)"></i>
        </div>
              
              <div>
                
              </div>
         

         <div class="_login_input_button">
             <button class="_btn _login_input_button_btn _bg" @click="join" type="button">Finish</button>

          <!-- <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button> -->
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            items:[],
            service_id:'',
            tagName:''
        }
    },
    methods:{
        async join(){
            if(this.items.length>0){
                    const res = await this.callApi('post', 'add-tag', this.items)
                    if(res.status==201){
                    this.s('Your tags have been successfully added!');
                    }
                    else{
                        this.swr();
                    }
            }
   
          //  this.$store.dispatch('setTabInfo',1);
        },
        add(){
            if(this.tagName==''){
                this.i('please enter the tag name')
                return
            }
            this.items.push({service_id:this.service_id,tagName:this.tagName})
            this.tagName = ''
        },
      delate(index){
           this.items.splice(index, 1);   
        },
    },
     created(){
        this.service_id = this.getService_id
    }
   

}
</script>

<style>

</style>
