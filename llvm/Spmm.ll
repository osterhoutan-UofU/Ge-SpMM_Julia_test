; PTX CompilerJob of kernel SpMM(CuDeviceVector{Int32, 1}, CuDeviceVector{Int32, 1}, CuDeviceVector{Float64, 1}, CuDeviceMatrix{Float64, 1}, CuDeviceMatrix{Float64, 1}) for sm_61
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:61 within `SpMM'
define ptx_kernel void @_Z15julia_SpMM_273613CuDeviceArrayI5Int32Li1ELi1EES_IS0_Li1ELi1EES_I7Float64Li1ELi1EES_IS1_Li2ELi1EES_IS1_Li2ELi1EE({ i8 addrspace(1)*, i64, [1 x i64] } %0, { i8 addrspace(1)*, i64, [1 x i64] } %1, { i8 addrspace(1)*, i64, [1 x i64] } %2, { i8 addrspace(1)*, i64, [2 x i64] } %3, { i8 addrspace(1)*, i64, [2 x i64] } %4) local_unnamed_addr {
entry:
  %5 = alloca [1 x i64], align 8
  %6 = alloca [1 x i64], align 8
  %7 = alloca { i8 addrspace(3)*, i64, [1 x i64] }, align 8
  %8 = alloca { i8 addrspace(3)*, i64, [1 x i64] }, align 8
  %9 = alloca [1 x i64], align 8
  %10 = alloca [1 x i64], align 8
  %11 = alloca [1 x i64], align 8
  %12 = alloca [1 x i64], align 8
  %13 = alloca [2 x i64], align 8
  %14 = alloca [2 x i64], align 8
  %15 = alloca { i8 addrspace(1)*, i64, [1 x i64] }, align 8
  %.fca.0.extract23 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %0, 0
  %.fca.0.gep24 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %15, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract23, i8 addrspace(1)** %.fca.0.gep24, align 8
  %.fca.1.extract25 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %0, 1
  %.fca.1.gep26 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %15, i64 0, i32 1
  store i64 %.fca.1.extract25, i64* %.fca.1.gep26, align 8
  %.fca.2.0.extract27 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %0, 2, 0
  %.fca.2.0.gep28 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %15, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract27, i64* %.fca.2.0.gep28, align 8
  %16 = alloca { i8 addrspace(1)*, i64, [1 x i64] }, align 8
  %.fca.0.extract17 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %1, 0
  %.fca.0.gep18 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %16, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract17, i8 addrspace(1)** %.fca.0.gep18, align 8
  %.fca.1.extract19 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %1, 1
  %.fca.1.gep20 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %16, i64 0, i32 1
  store i64 %.fca.1.extract19, i64* %.fca.1.gep20, align 8
  %.fca.2.0.extract21 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %1, 2, 0
  %.fca.2.0.gep22 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %16, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract21, i64* %.fca.2.0.gep22, align 8
  %17 = alloca { i8 addrspace(1)*, i64, [1 x i64] }, align 8
  %.fca.0.extract11 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %2, 0
  %.fca.0.gep12 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %17, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract11, i8 addrspace(1)** %.fca.0.gep12, align 8
  %.fca.1.extract13 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %2, 1
  %.fca.1.gep14 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %17, i64 0, i32 1
  store i64 %.fca.1.extract13, i64* %.fca.1.gep14, align 8
  %.fca.2.0.extract15 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %2, 2, 0
  %.fca.2.0.gep16 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %17, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract15, i64* %.fca.2.0.gep16, align 8
  %18 = alloca { i8 addrspace(1)*, i64, [2 x i64] }, align 8
  %.fca.0.extract3 = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %3, 0
  %.fca.0.gep4 = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %18, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract3, i8 addrspace(1)** %.fca.0.gep4, align 8
  %.fca.1.extract5 = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %3, 1
  %.fca.1.gep6 = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %18, i64 0, i32 1
  store i64 %.fca.1.extract5, i64* %.fca.1.gep6, align 8
  %.fca.2.0.extract7 = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %3, 2, 0
  %.fca.2.0.gep8 = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %18, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract7, i64* %.fca.2.0.gep8, align 8
  %.fca.2.1.extract9 = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %3, 2, 1
  %.fca.2.1.gep10 = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %18, i64 0, i32 2, i64 1
  store i64 %.fca.2.1.extract9, i64* %.fca.2.1.gep10, align 8
  %19 = alloca { i8 addrspace(1)*, i64, [2 x i64] }, align 8
  %.fca.0.extract = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %4, 0
  %.fca.0.gep = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %19, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract, i8 addrspace(1)** %.fca.0.gep, align 8
  %.fca.1.extract = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %4, 1
  %.fca.1.gep = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %19, i64 0, i32 1
  store i64 %.fca.1.extract, i64* %.fca.1.gep, align 8
  %.fca.2.0.extract = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %4, 2, 0
  %.fca.2.0.gep = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %19, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract, i64* %.fca.2.0.gep, align 8
  %.fca.2.1.extract = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %4, 2, 1
  %.fca.2.1.gep = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %19, i64 0, i32 2, i64 1
  store i64 %.fca.2.1.extract, i64* %.fca.2.1.gep, align 8
  %20 = bitcast [1 x i64]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20)
  %21 = bitcast [1 x i64]* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %21)
  %22 = bitcast { i8 addrspace(3)*, i64, [1 x i64] }* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %22)
  %23 = bitcast { i8 addrspace(3)*, i64, [1 x i64] }* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %23)
  %24 = bitcast [1 x i64]* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %24)
  %25 = bitcast [1 x i64]* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %25)
  %26 = bitcast [1 x i64]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %26)
  %27 = bitcast [1 x i64]* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %27)
  %28 = bitcast [2 x i64]* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %28)
  %29 = bitcast [2 x i64]* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %29)
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:68 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:97 within `warpsize'
   %30 = call i32 @llvm.nvvm.read.ptx.sreg.warpsize()
; │┌ @ boot.jl:752 within `Int64'
; ││┌ @ boot.jl:676 within `toInt64'
     %31 = zext i32 %30 to i64
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:69 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:90 within `threadIdx'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:46 within `threadIdx_x'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `_index'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
      %32 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
; ││└└
; ││┌ @ boot.jl:752 within `Int64'
; │││┌ @ boot.jl:676 within `toInt64'
      %33 = zext i32 %32 to i64
; ││└└
; ││┌ @ int.jl:87 within `+'
     %34 = add nuw nsw i64 %33, 1
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:70 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:76 within `blockIdx'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:56 within `blockIdx_x'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `_index'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
      %35 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
; ││└└
; ││┌ @ boot.jl:752 within `Int64'
; │││┌ @ boot.jl:676 within `toInt64'
      %36 = zext i32 %35 to i64
; ││└└
; ││┌ @ int.jl:87 within `+'
     %37 = add nuw nsw i64 %36, 1
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:74 within `SpMM'
; ┌ @ int.jl:262 within `rem'
   %.not = icmp eq i32 %30, 0
   %38 = bitcast i8 addrspace(1)* %.fca.0.extract23 to i32 addrspace(1)*
   %39 = bitcast i8 addrspace(1)* %.fca.0.extract17 to i32 addrspace(1)*
   %40 = bitcast i8 addrspace(1)* %.fca.0.extract11 to double addrspace(1)*
   %41 = bitcast i8 addrspace(1)* %.fca.0.extract3 to double addrspace(1)*
   br i1 %.not, label %fail.i, label %pass.i

L47.i:                                            ; preds = %pass.i, %L48.i
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:77 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %42 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %36
        %43 = load i32, i32 addrspace(1)* %42, align 4
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:78 within `SpMM'
; ┌ @ int.jl:87 within `+'
   %44 = add nuw nsw i64 %36, 2
; └
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    %45 = getelementptr inbounds [1 x i64], [1 x i64]* %6, i64 0, i64 0
    store i64 %44, i64* %45, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %.not32 = icmp sgt i64 %44, %147
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     br i1 %.not32, label %L70.i, label %L69.i

L48.i:                                            ; preds = %pass.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:77 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2774() #2
     call void asm sideeffect "trap;", ""() #5
     br label %L47.i

L69.i:                                            ; preds = %L70.i, %L47.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:78 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %46 = getelementptr inbounds i32, i32 addrspace(1)* %38, i64 %37
        %47 = load i32, i32 addrspace(1)* %46, align 4
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:80 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\memory_shared.jl:25 within `macro expansion'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:44 within `CuDeviceArray' @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:35 @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:35
    %48 = getelementptr inbounds { i8 addrspace(3)*, i64, [1 x i64] }, { i8 addrspace(3)*, i64, [1 x i64] }* %7, i64 0, i32 0
    store i8 addrspace(3)* bitcast ([1024 x i32] addrspace(3)* @__static_shmem_327 to i8 addrspace(3)*), i8 addrspace(3)** %48, align 8
    %49 = getelementptr inbounds { i8 addrspace(3)*, i64, [1 x i64] }, { i8 addrspace(3)*, i64, [1 x i64] }* %7, i64 0, i32 1
    store i64 4096, i64* %49, align 8
    %.fca.0.gep30 = getelementptr inbounds { i8 addrspace(3)*, i64, [1 x i64] }, { i8 addrspace(3)*, i64, [1 x i64] }* %7, i64 0, i32 2, i64 0
    store i64 1024, i64* %.fca.0.gep30, align 8
; └└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:81 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\memory_shared.jl:25 within `macro expansion'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:44 within `CuDeviceArray' @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:35 @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:35
    %50 = getelementptr inbounds { i8 addrspace(3)*, i64, [1 x i64] }, { i8 addrspace(3)*, i64, [1 x i64] }* %8, i64 0, i32 0
    store i8 addrspace(3)* bitcast ([1024 x double] addrspace(3)* @__static_shmem_328 to i8 addrspace(3)*), i8 addrspace(3)** %50, align 8
    %51 = getelementptr inbounds { i8 addrspace(3)*, i64, [1 x i64] }, { i8 addrspace(3)*, i64, [1 x i64] }* %8, i64 0, i32 1
    store i64 8192, i64* %51, align 8
    %.fca.0.gep29 = getelementptr inbounds { i8 addrspace(3)*, i64, [1 x i64] }, { i8 addrspace(3)*, i64, [1 x i64] }* %8, i64 0, i32 2, i64 0
    store i64 1024, i64* %.fca.0.gep29, align 8
; └└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:82 within `SpMM'
; ┌ @ int.jl:921 within `-'
; │┌ @ int.jl:477 within `rem'
    %52 = sext i32 %47 to i64
; └└
; ┌ @ int.jl:923 within `-' @ int.jl:86
   %53 = add nsw i64 %52, -1
; └
; ┌ @ range.jl:10 within `Colon'
; │┌ @ number.jl:7 within `convert'
; ││┌ @ boot.jl:752 within `Int64'
; │││┌ @ boot.jl:671 within `toInt64'
      %54 = sext i32 %43 to i64
; │└└└
; │ @ range.jl:10 within `Colon' @ range.jl:22
; │┌ @ range.jl:24 within `_colon'
; ││┌ @ range.jl:263 within `StepRange' @ range.jl:208
     %55 = call fastcc i64 @julia_steprange_last_2792(i64 signext %54, i64 signext %31, i64 signext %53) #2
; └└└
; ┌ @ range.jl:670 within `iterate'
; │┌ @ range.jl:517 within `isempty'
; ││┌ @ operators.jl:204 within `!='
; │││┌ @ promotion.jl:410 within `=='
      %56 = icmp ne i64 %55, %54
; ││└└
; ││┌ @ operators.jl:305 within `>'
; │││┌ @ int.jl:83 within `<'
      %57 = icmp ne i32 %30, 0
      %58 = icmp sgt i64 %55, %54
; ││└└
; ││┌ @ operators.jl:204 within `!='
; │││┌ @ bool.jl:33 within `!'
      %59 = xor i1 %57, %58
; ││└└
; ││┌ @ bool.jl:36 within `&'
     %60 = and i1 %56, %59
; └└└
  br i1 %60, label %L345.i, label %L107.i.preheader

L107.i.preheader:                                 ; preds = %L69.i
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:84 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl within `arrayref'
    %61 = getelementptr inbounds [1 x i64], [1 x i64]* %9, i64 0, i64 0
; │└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:312 within `eachindex'
; ││││┌ @ abstractarray.jl:109 within `axes1'
; │││││┌ @ abstractarray.jl:89 within `axes'
; ││││││┌ @ tuple.jl:213 within `map'
; │││││││┌ @ range.jl:337 within `oneto'
; ││││││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; │││││││││┌ @ promotion.jl within `max'
            %62 = icmp sgt i64 %.fca.2.0.extract21, 0
            %63 = select i1 %62, i64 %.fca.2.0.extract21, i64 0
; └└└└└└└└└└
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:192 within `setindex!'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:153 within `arrayset'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:162 within `arrayset_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:84 within `unsafe_store!'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `pointerset'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:0
        %64 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @__static_shmem_327, i64 0, i64 %33
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:85 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl within `arrayref'
    %65 = getelementptr inbounds [1 x i64], [1 x i64]* %10, i64 0, i64 0
; │└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:312 within `eachindex'
; ││││┌ @ abstractarray.jl:109 within `axes1'
; │││││┌ @ abstractarray.jl:89 within `axes'
; ││││││┌ @ tuple.jl:213 within `map'
; │││││││┌ @ range.jl:337 within `oneto'
; ││││││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; │││││││││┌ @ promotion.jl within `max'
            %66 = icmp sgt i64 %.fca.2.0.extract15, 0
            %67 = select i1 %66, i64 %.fca.2.0.extract15, i64 0
; └└└└└└└└└└
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:192 within `setindex!'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:153 within `arrayset'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:162 within `arrayset_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:84 within `unsafe_store!'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `pointerset'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:0
        %68 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @__static_shmem_328, i64 0, i64 %33
        %69 = bitcast double addrspace(3)* %68 to i64 addrspace(3)*
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:88 within `SpMM'
; ┌ @ int.jl within `-'
   %70 = add nsw i64 %31, -1
; └
; ┌ @ range.jl:5 within `Colon'
; │┌ @ range.jl:287 within `UnitRange'
; ││┌ @ range.jl within `unitrange_last'
     %71 = select i1 %.not, i64 -1, i64 %70
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:82 within `SpMM'
; ┌ @ range.jl within `iterate'
   %.not37 = icmp slt i64 %71, 0
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:90 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl within `arrayref'
    %72 = getelementptr inbounds [1 x i64], [1 x i64]* %11, i64 0, i64 0
; └└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:91 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl within `arrayref'
    %73 = getelementptr inbounds [1 x i64], [1 x i64]* %12, i64 0, i64 0
; └└
; ┌ @ abstractarray.jl:1170 within `getindex'
; │┌ @ abstractarray.jl within `_getindex'
    %74 = getelementptr inbounds [2 x i64], [2 x i64]* %13, i64 0, i64 0
    %75 = getelementptr inbounds [2 x i64], [2 x i64]* %13, i64 0, i64 1
; │└
; │┌ @ abstractarray.jl:1196 within `_getindex'
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:595
; │││┌ @ abstractarray.jl:89 within `axes'
; ││││┌ @ tuple.jl:214 within `map'
; │││││┌ @ range.jl:337 within `oneto'
; ││││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; │││││││┌ @ promotion.jl within `max'
          %76 = icmp sgt i64 %.fca.2.0.extract7, 0
          %77 = select i1 %76, i64 %.fca.2.0.extract7, i64 0
          %78 = icmp sgt i64 %.fca.2.1.extract9, 0
          %79 = select i1 %78, i64 %.fca.2.1.extract9, i64 0
; │││└└└└└
; │││┌ @ abstractarray.jl:642 within `checkbounds_indices' @ abstractarray.jl:642
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl within `<='
        %80 = icmp sgt i64 %79, %33
; │└└└└└
; │┌ @ abstractarray.jl:1197 within `_getindex'
; ││┌ @ abstractarray.jl:1203 within `_to_linear_index'
; │││┌ @ abstractarray.jl:2011 within `_sub2ind' @ abstractarray.jl:2027
; ││││┌ @ abstractarray.jl:2043 within `_sub2ind_recurse' @ abstractarray.jl:2043
; │││││┌ @ int.jl within `*'
        %81 = mul i64 %77, %33
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:83 within `SpMM'
  br label %L107.i

L70.i:                                            ; preds = %L47.i
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:78 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2774() #2
     call void asm sideeffect "trap;", ""() #5
     br label %L69.i

L107.i:                                           ; preds = %L330.i, %L107.i.preheader
     %value_phi3.i = phi i64 [ %133, %L330.i ], [ %54, %L107.i.preheader ]
     %value_phi5.i = phi double [ %value_phi16.i, %L330.i ], [ 0.000000e+00, %L107.i.preheader ]
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:83 within `SpMM'
; ┌ @ int.jl:87 within `+'
   %82 = add i64 %value_phi3.i, %143
; └
; ┌ @ promotion.jl:361 within `<' @ int.jl:83
   %.not35 = icmp slt i64 %82, %52
; └
  br i1 %.not35, label %L114.i, label %L195.i

L114.i:                                           ; preds = %L107.i
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:84 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %82, i64* %61, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %83 = icmp slt i64 %82, 1
       %84 = icmp sgt i64 %82, %63
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %85 = or i1 %83, %84
     br i1 %85, label %L126.i, label %L125.i

L125.i:                                           ; preds = %L126.i, %L114.i
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││┌ @ int.jl:86 within `-'
         %86 = add i64 %82, -1
; ││││││└
        %87 = getelementptr inbounds i32, i32 addrspace(1)* %39, i64 %86
        %88 = load i32, i32 addrspace(1)* %87, align 4
; └└└└└└
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:192 within `setindex!'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:153 within `arrayset'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:162 within `arrayset_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:84 within `unsafe_store!'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `pointerset'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        store i32 %88, i32 addrspace(3)* %64, align 4
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:85 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %82, i64* %65, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %89 = icmp sgt i64 %82, %67
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %90 = or i1 %83, %89
     br i1 %90, label %L166.i, label %L165.i

L126.i:                                           ; preds = %L114.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:84 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2774() #2
     call void asm sideeffect "trap;", ""() #5
     br label %L125.i

L165.i:                                           ; preds = %L166.i, %L125.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:85 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %91 = getelementptr inbounds double, double addrspace(1)* %40, i64 %86
        %92 = bitcast double addrspace(1)* %91 to i64 addrspace(1)*
        %93 = load i64, i64 addrspace(1)* %92, align 8
; └└└└└└
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:192 within `setindex!'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:153 within `arrayset'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:162 within `arrayset_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:84 within `unsafe_store!'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `pointerset'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        store i64 %93, i64 addrspace(3)* %69, align 8
; │└└└└└
   br label %L195.i

L166.i:                                           ; preds = %L125.i
; └
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2780() #2
     call void asm sideeffect "trap;", ""() #5
     br label %L165.i

L195.i:                                           ; preds = %L165.i, %L107.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:87 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\synchronization.jl:76 within `sync_warp' @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\synchronization.jl:76
; │┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\asmcall.jl:3 within `_asmcall'
; ││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\asmcall.jl:3 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
     call void asm sideeffect "bar.warp.sync $0;", "r"(i32 -1) #5
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:88 within `SpMM'
  br i1 %.not37, label %L330.i, label %L210.i.preheader

L210.i.preheader:                                 ; preds = %L195.i
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:89 within `SpMM'
  br i1 %80, label %L210.i.us, label %L210.i

L210.i.us:                                        ; preds = %L318.i.us, %L210.i.preheader
  %value_phi9.i.us = phi double [ %value_phi12.i.us, %L318.i.us ], [ %value_phi5.i, %L210.i.preheader ]
  %value_phi10.i.us = phi i64 [ %114, %L318.i.us ], [ 0, %L210.i.preheader ]
; ┌ @ int.jl:87 within `+'
   %94 = add i64 %value_phi10.i.us, %value_phi3.i
; └
; ┌ @ int.jl:442 within `<='
   %.not38.not.us = icmp slt i64 %94, %52
; └
  br i1 %.not38.not.us, label %L218.i.us, label %L318.i.us

L218.i.us:                                        ; preds = %L210.i.us
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:90 within `SpMM'
; ┌ @ int.jl:87 within `+'
   %95 = add i64 %value_phi10.i.us, %144
; └
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %95, i64* %72, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ bool.jl:36 within `&'
       %.off.us = add i64 %95, -1
       %96 = icmp ugt i64 %.off.us, 1023
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     br i1 %96, label %L247.i.us, label %L227.i.us

L227.i.us:                                        ; preds = %L218.i.us
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %97 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @__static_shmem_327, i64 0, i64 %.off.us
        %98 = load i32, i32 addrspace(3)* %97, align 4
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:91 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %95, i64* %73, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     br label %L246.i.us

L247.i.us:                                        ; preds = %L218.i.us
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:90 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2777() #2
     call void asm sideeffect "trap;", ""() #5
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %99 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @__static_shmem_327, i64 0, i64 %.off.us
        %100 = load i32, i32 addrspace(3)* %99, align 4
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:91 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %95, i64* %73, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2783() #2
     call void asm sideeffect "trap;", ""() #5
     br label %L246.i.us

L246.i.us:                                        ; preds = %L247.i.us, %L227.i.us
     %101 = phi i32 [ %100, %L247.i.us ], [ %98, %L227.i.us ]
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %102 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @__static_shmem_328, i64 0, i64 %.off.us
        %103 = load double, double addrspace(3)* %102, align 8
; └└└└└└
; ┌ @ abstractarray.jl:1170 within `getindex'
; │┌ @ indices.jl:330 within `to_indices' @ indices.jl:333
; ││┌ @ indices.jl:277 within `to_index' @ indices.jl:292
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:752 within `Int64'
; │││││┌ @ boot.jl:671 within `toInt64'
        %104 = sext i32 %101 to i64
; │└└└└└
; │┌ @ abstractarray.jl:1196 within `_getindex'
    store i64 %104, i64* %74, align 8
    store i64 %34, i64* %75, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:595
; │││┌ @ abstractarray.jl:642 within `checkbounds_indices'
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl:442 within `<='
        %105 = icmp sgt i32 %101, 0
        %106 = icmp sge i64 %77, %104
; │││││└
; │││││┌ @ bool.jl:36 within `&'
        %107 = and i1 %105, %106
; │││└└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     br i1 %107, label %L275.i.us, label %L276.i.us

L276.i.us:                                        ; preds = %L246.i.us
     call fastcc void @julia_throw_boundserror_2786() #2
     call void asm sideeffect "trap;", ""() #5
     br label %L275.i.us

L275.i.us:                                        ; preds = %L276.i.us, %L246.i.us
; │└└
; │┌ @ abstractarray.jl:1197 within `_getindex'
; ││┌ @ abstractarray.jl:1203 within `_to_linear_index'
; │││┌ @ abstractarray.jl:2011 within `_sub2ind' @ abstractarray.jl:2027
; ││││┌ @ abstractarray.jl:2043 within `_sub2ind_recurse' @ abstractarray.jl:2043
; │││││┌ @ int.jl:87 within `+'
        %108 = add nsw i64 %104, -1
; ││└└└└
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││││┌ @ int.jl:86 within `-'
           %109 = add i64 %108, %81
; ││││││││└
          %110 = getelementptr inbounds double, double addrspace(1)* %41, i64 %109
          %111 = load double, double addrspace(1)* %110, align 8
; └└└└└└└└
; ┌ @ float.jl:332 within `*'
   %112 = fmul double %103, %111
; └
; ┌ @ float.jl:326 within `+'
   %113 = fadd double %value_phi9.i.us, %112
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:82 within `SpMM'
; ┌ @ range.jl:670 within `iterate'
   br label %L318.i.us

L318.i.us:                                        ; preds = %L275.i.us, %L210.i.us
   %value_phi12.i.us = phi double [ %113, %L275.i.us ], [ %value_phi9.i.us, %L210.i.us ]
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:91 within `SpMM'
; ┌ @ range.jl:674 within `iterate'
; │┌ @ promotion.jl:410 within `=='
    %.not40.not.us = icmp eq i64 %value_phi10.i.us, %71
; │└
   %114 = add i64 %value_phi10.i.us, 1
; └
  br i1 %.not40.not.us, label %L330.i, label %L210.i.us

L210.i:                                           ; preds = %L318.i, %L210.i.preheader
  %value_phi9.i = phi double [ %value_phi12.i, %L318.i ], [ %value_phi5.i, %L210.i.preheader ]
  %value_phi10.i = phi i64 [ %132, %L318.i ], [ 0, %L210.i.preheader ]
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:89 within `SpMM'
; ┌ @ int.jl:87 within `+'
   %115 = add i64 %value_phi10.i, %value_phi3.i
; └
; ┌ @ int.jl:442 within `<='
   %.not38.not = icmp slt i64 %115, %52
; └
  br i1 %.not38.not, label %L218.i, label %L318.i

L218.i:                                           ; preds = %L210.i
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:90 within `SpMM'
; ┌ @ int.jl:87 within `+'
   %116 = add i64 %value_phi10.i, %144
; └
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %116, i64* %72, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ bool.jl:36 within `&'
       %.off = add i64 %116, -1
       %117 = icmp ugt i64 %.off, 1023
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     br i1 %117, label %L247.i, label %L227.i

L227.i:                                           ; preds = %L218.i
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %118 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @__static_shmem_327, i64 0, i64 %.off
        %119 = load i32, i32 addrspace(3)* %118, align 4
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:91 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %116, i64* %73, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     br label %L275.i

L247.i:                                           ; preds = %L218.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:90 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2777() #2
     call void asm sideeffect "trap;", ""() #5
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %120 = getelementptr inbounds [1024 x i32], [1024 x i32] addrspace(3)* @__static_shmem_327, i64 0, i64 %.off
        %121 = load i32, i32 addrspace(3)* %120, align 4
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:91 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %116, i64* %73, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2783() #2
     call void asm sideeffect "trap;", ""() #5
     br label %L275.i

L275.i:                                           ; preds = %L247.i, %L227.i
     %122 = phi i32 [ %121, %L247.i ], [ %119, %L227.i ]
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %123 = getelementptr inbounds [1024 x double], [1024 x double] addrspace(3)* @__static_shmem_328, i64 0, i64 %.off
        %124 = load double, double addrspace(3)* %123, align 8
; └└└└└└
; ┌ @ abstractarray.jl:1170 within `getindex'
; │┌ @ indices.jl:330 within `to_indices' @ indices.jl:333
; ││┌ @ indices.jl:277 within `to_index' @ indices.jl:292
; │││┌ @ number.jl:7 within `convert'
; ││││┌ @ boot.jl:752 within `Int64'
; │││││┌ @ boot.jl:671 within `toInt64'
        %125 = sext i32 %122 to i64
; │└└└└└
; │┌ @ abstractarray.jl:1196 within `_getindex'
    store i64 %125, i64* %74, align 8
    store i64 %34, i64* %75, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2786() #2
     call void asm sideeffect "trap;", ""() #5
; │└└
; │┌ @ abstractarray.jl:1197 within `_getindex'
; ││┌ @ abstractarray.jl:1203 within `_to_linear_index'
; │││┌ @ abstractarray.jl:2011 within `_sub2ind' @ abstractarray.jl:2027
; ││││┌ @ abstractarray.jl:2043 within `_sub2ind_recurse' @ abstractarray.jl:2043
; │││││┌ @ int.jl:87 within `+'
        %126 = add nsw i64 %125, -1
; ││└└└└
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││││┌ @ int.jl:86 within `-'
           %127 = add i64 %126, %81
; ││││││││└
          %128 = getelementptr inbounds double, double addrspace(1)* %41, i64 %127
          %129 = load double, double addrspace(1)* %128, align 8
; └└└└└└└└
; ┌ @ float.jl:332 within `*'
   %130 = fmul double %124, %129
; └
; ┌ @ float.jl:326 within `+'
   %131 = fadd double %value_phi9.i, %130
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:82 within `SpMM'
; ┌ @ range.jl:670 within `iterate'
   br label %L318.i

L318.i:                                           ; preds = %L275.i, %L210.i
   %value_phi12.i = phi double [ %131, %L275.i ], [ %value_phi9.i, %L210.i ]
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:91 within `SpMM'
; ┌ @ range.jl:674 within `iterate'
; │┌ @ promotion.jl:410 within `=='
    %.not40.not = icmp eq i64 %value_phi10.i, %71
; │└
   %132 = add i64 %value_phi10.i, 1
; └
  br i1 %.not40.not, label %L330.i, label %L210.i

L330.i:                                           ; preds = %L318.i, %L318.i.us, %L195.i
  %value_phi16.i = phi double [ %value_phi5.i, %L195.i ], [ %value_phi12.i.us, %L318.i.us ], [ %value_phi12.i, %L318.i ]
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:94 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\synchronization.jl:76 within `sync_warp' @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\synchronization.jl:76
; │┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\asmcall.jl:3 within `_asmcall'
; ││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\asmcall.jl:3 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
     call void asm sideeffect "bar.warp.sync $0;", "r"(i32 -1) #5
; └└└
; ┌ @ range.jl:674 within `iterate'
; │┌ @ promotion.jl:410 within `=='
    %.not41.not = icmp eq i64 %value_phi3.i, %55
; │└
   %133 = add i64 %value_phi3.i, %31
; └
  br i1 %.not41.not, label %L345.i, label %L107.i

L345.i:                                           ; preds = %L330.i, %L69.i
  %value_phi20.i = phi double [ 0.000000e+00, %L69.i ], [ %value_phi16.i, %L330.i ]
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:96 within `SpMM'
; ┌ @ abstractarray.jl:1267 within `setindex!'
; │┌ @ abstractarray.jl:1289 within `_setindex!'
    %134 = getelementptr inbounds [2 x i64], [2 x i64]* %14, i64 0, i64 0
    store i64 %37, i64* %134, align 8
    %135 = getelementptr inbounds [2 x i64], [2 x i64]* %14, i64 0, i64 1
    store i64 %34, i64* %135, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:595
; │││┌ @ abstractarray.jl:89 within `axes'
; ││││┌ @ tuple.jl:214 within `map'
; │││││┌ @ range.jl:337 within `oneto'
; ││││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; │││││││┌ @ promotion.jl:421 within `max'
          %136 = icmp sgt i64 %.fca.2.0.extract, 0
          %137 = select i1 %136, i64 %.fca.2.0.extract, i64 0
          %138 = icmp sgt i64 %.fca.2.1.extract, 0
          %139 = select i1 %138, i64 %.fca.2.1.extract, i64 0
; │││└└└└└
; │││┌ @ abstractarray.jl:642 within `checkbounds_indices'
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl:442 within `<='
        %140 = icmp sle i64 %137, %36
; ││││└└
; ││││ @ abstractarray.jl:642 within `checkbounds_indices' @ abstractarray.jl:642
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl:442 within `<='
        %141 = icmp sle i64 %139, %33
; │││└└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %142 = or i1 %140, %141
     br i1 %142, label %L365.i, label %_Z15julia_SpMM_273613CuDeviceArrayI5Int32Li1ELi1EES_IS0_Li1ELi1EES_I7Float64Li1ELi1EES_IS1_Li2ELi1EES_IS1_Li2ELi1EE.inner.exit

L365.i:                                           ; preds = %L345.i
     call fastcc void @julia_throw_boundserror_2786() #2
     call void asm sideeffect "trap;", ""() #5
     br label %_Z15julia_SpMM_273613CuDeviceArrayI5Int32Li1ELi1EES_IS0_Li1ELi1EES_I7Float64Li1ELi1EES_IS1_Li2ELi1EES_IS1_Li2ELi1EE.inner.exit

fail.i:                                           ; preds = %entry
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:74 within `SpMM'
; ┌ @ int.jl:262 within `rem'
   call fastcc void @gpu_report_exception_name(i64 ptrtoint ([10 x i8]* @exception93 to i64))
   call fastcc void @gpu_report_exception_frame(i32 1, i64 ptrtoint ([4 x i8]* @di_func77 to i64), i64 ptrtoint ([9 x i8]* @di_file78 to i64), i32 262)
   call fastcc void @gpu_report_exception_frame(i32 2, i64 ptrtoint ([5 x i8]* @di_func116 to i64), i64 ptrtoint ([62 x i8]* @di_file117 to i64), i32 74)
   call fastcc void @gpu_signal_exception()
   call void asm sideeffect "trap;", ""() #5
   br label %pass.i

pass.i:                                           ; preds = %fail.i, %entry
   %143 = urem i64 %33, %31
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:76 within `SpMM'
; ┌ @ int.jl:86 within `-'
   %144 = sub nsw i64 %34, %143
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:77 within `SpMM'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    %145 = getelementptr inbounds [1 x i64], [1 x i64]* %5, i64 0, i64 0
    store i64 %37, i64* %145, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:312 within `eachindex'
; ││││┌ @ abstractarray.jl:109 within `axes1'
; │││││┌ @ abstractarray.jl:89 within `axes'
; ││││││┌ @ tuple.jl:213 within `map'
; │││││││┌ @ range.jl:337 within `oneto'
; ││││││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; │││││││││┌ @ promotion.jl:421 within `max'
            %146 = icmp sgt i64 %.fca.2.0.extract27, 0
            %147 = select i1 %146, i64 %.fca.2.0.extract27, i64 0
; │││└└└└└└└
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %.not31 = icmp sgt i64 %147, %36
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     br i1 %.not31, label %L47.i, label %L48.i

_Z15julia_SpMM_273613CuDeviceArrayI5Int32Li1ELi1EES_IS0_Li1ELi1EES_I7Float64Li1ELi1EES_IS1_Li2ELi1EES_IS1_Li2ELi1EE.inner.exit: ; preds = %L365.i, %L345.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:74 within `SpMM'
; ┌ @ int.jl:262 within `rem'
   %148 = bitcast i8 addrspace(1)* %.fca.0.extract to double addrspace(1)*
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:96 within `SpMM'
; ┌ @ abstractarray.jl:1267 within `setindex!'
; │┌ @ abstractarray.jl:1290 within `_setindex!'
; ││┌ @ abstractarray.jl:1203 within `_to_linear_index'
; │││┌ @ abstractarray.jl:2011 within `_sub2ind' @ abstractarray.jl:2027
; ││││┌ @ abstractarray.jl:2043 within `_sub2ind_recurse' @ abstractarray.jl:2043
; │││││┌ @ int.jl:88 within `*'
        %149 = mul i64 %137, %33
; ││└└└└
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:192 within `setindex!'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:153 within `arrayset'
; ││││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:162 within `arrayset_bits'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:84 within `unsafe_store!'
; ││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `pointerset'
; │││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││││┌ @ int.jl:86 within `-'
           %150 = add i64 %149, %36
; ││││││││└
          %151 = getelementptr inbounds double, double addrspace(1)* %148, i64 %150
          store double %value_phi20.i, double addrspace(1)* %151, align 8
; └└└└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM.jl:97 within `SpMM'
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %21)
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %22)
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %23)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %24)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %25)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %26)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %27)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %28)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %29)
  ret void
}
