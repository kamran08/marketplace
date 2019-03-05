<template>
    <div class="_login_input_group">
        <div class="_1steps_img _1steps_shadow">
            <img class="_1steps_img_pic" :src="active.imageName"  title="">
        </div>
        <div class="_1steps_img_select">
            <ul class="_1steps_img_select_pic">
                <template v-if="uploads.length" >
                <li class="_1steps_shadow  " v-for="(item,index) in uploads" :key="index" :class="(index==1)?'_1steps_img_select_active' : ''" >
                    <img :src="item.imageName"  title="">
                    <p class="_1steps_cencel _1steps_shadow">
                       <i class="fas fa-plus"></i>
                    </p>
                </li>
                </template>
                <li class="_1steps_add">
                    <Col span="24" class="dream-input-main" >
                        <Upload
                            ref="upload"
                            type="drag"
                            name="img"
                            :show-upload-list="listMethod" 
                            :with-credentials="true"
                            :headers="crfObj"
                            
                            :on-success="handleSuccess"
                            :format="['jpg','jpeg','png']"
                            :max-size="2048"
                            action="/app/getServiceImage">
                            <!-- action="/app/uploadServiceImages"> -->
                            <div  >
                                <i class="fas fa-plus"></i>
                            </div>
                        </Upload>
                    </Col>
                </li>
            </ul>
        </div>
         <div class="_login_input_button">
                <button class="_btn _login_input_button_btn _bg" @click="join" type="button">Next Step</button>
                <!-- <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button> -->
         </div>
    </div>    
</template>

<script>
export default {
    data(){
        return{

            listMethod:false,
            items:[],
            itemName:'',
            itemPrice:0,
            ok:0,
            alljobs:'',
            visible: false,
            catagory:'catagory',
            crfObj: {
                    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
            service_id:1,
            uploads:[],
            active:{
                imageName:"/uploads/default.png",
            }

        }
    },
    methods:{
        async join(){
            if(!this.uploads.length){
                this.i("You must upload atleast 1 Photo!");
                return;
            }
            for (const i of this.uploads) {
                i.service_id = this.service_id;
            }
            const res = await this.callApi('post',"saveServiceImage",this.uploads)
            if(res.status===200){
                this.s("Images uploaded Successfully!")
                this.$store.dispatch('setTabInfo',this.LinkFlagTab+1);
            }
            else{
                this.swr();
            }
            console.log(this.uploads);
        
            
        },
        handleSuccess(res, file){
            console.log(res);
             this.active.imageName = res;
            this.uploads.push({imageName:this.active.imageName});
            console.log(res);
           
        },
       
    },
    created(){
        this.i("Please upload your Service Images");
    }

}
</script>

<style>

</style>
