<template>
    <div>
        <h1>THIS IS A TEST PAGE LOADED FROM TEST MODULES</h1>
        <h1>Test number is: {{$store.state.testNumber}}</h1>
        <!-- <h1>Test Module number is: {{$store.state.teststore.testModuleNumber}}</h1> -->
        <Input v-model="data.password" type="password" size="large" placeholder="******" required/>
    
    </div>
</template>

<script>
export default {
    

}
</script>

