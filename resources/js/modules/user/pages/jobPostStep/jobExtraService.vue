<template>
    <div class="_login_input_group">
        <p class="_1steps_input_title" >EXTRA</p>
        <div class="_login_input" v-for="(item,i) in items" :key="i" >
            <div class="_login_input_inp" >
                <input class="_login_input_inp_field" v-model="item.name" placeholder="Extra" type="text">
                <input class="_login_input_inp_field" v-model="item.price" placeholder="price" type="text">
                 <a id="thisok" class="remove-items mjob-remove-extra-item"><i class="fa fa-times"></i></a>
            </div>
        </div>
        <div v-if="ok">
        <input class="_login_input_inp_field" v-model="itemName" placeholder="Extra" type="text">
        <input class="_login_input_inp_field" v-model="itemPrice" placeholder="price" type="text"> 
        
                 <a id="thisok" class="remove-items mjob-remove-extra-item"><i class="fa fa-times"></i></a>
          
      
        </div>
        <Button @click="add">add</Button>
         <div class="_login_input_button">
                                        <button class="_btn _login_input_button_btn _bg" @click="join" type="button">JOIN NOW</button>

                                        <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button>
                                    </div>
       
    
    </div>
</template>

<script>
export default {
    data(){
        return{
            formdata:{
                title:'',
                cat_id:'',
                user_id:this.authInfo,
                price:'',
                videoLink:'',
                description:'',
                openingMassage:'',
                daliveryTime:'',
                isFeatured:'',
            },
                items:[],
          itemName:'',
          itemPrice:0,
          ok:0,
          alljobs:'',
          visible: false,
          catagory:'catagory'

        }
    },
    methods:{
        join(){
            this.$store.dispatch('setTabInfo',4);
        },
         add(){
            //data.push({"name": "Tony Montana", "age": "99"});
            if(this.ok>0){
                this.items.push({name:this.itemName,price:this.itemPrice})
                    this.ok=1
                    this.itemName=''
                    this.itemPrice=0
            }
            else{
                    this.ok=1
          
            }
        },
        
    }

}
</script>

<style>

</style>
