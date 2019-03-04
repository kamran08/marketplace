<template>
    <div class="_login_input_group">
        <p class="_1steps_input_title">TAGS</p>
        <div class="_login_input">
            <div class="_login_input_inp">
                <input class="_login_input_inp_field" v-model="formdata.title" placeholder="Extra" type="text">
            </div>
        </div>
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
            this.$store.dispatch('setTabInfo',1);
        }
    }

}
</script>

<style>

</style>
