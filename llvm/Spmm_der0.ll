; PTX CompilerJob of kernel SpMM_der0(Int64, Int64, Int64, CuDeviceVector{Int64, 1}, CuDeviceVector{Int64, 1}, CuDeviceVector{Float64, 1}, CuDeviceMatrix{Float64, 1}, CuDeviceMatrix{Float64, 1}, Int64) for sm_61
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:9 within `SpMM_der0'
define ptx_kernel void @_Z20julia_SpMM_der0_25255Int64S_S_13CuDeviceArrayIS_Li1ELi1EES0_IS_Li1ELi1EES0_I7Float64Li1ELi1EES0_IS1_Li2ELi1EES0_IS1_Li2ELi1EES_(i64 signext %0, i64 signext %1, i64 signext %2, { i8 addrspace(1)*, i64, [1 x i64] } %3, { i8 addrspace(1)*, i64, [1 x i64] } %4, { i8 addrspace(1)*, i64, [1 x i64] } %5, { i8 addrspace(1)*, i64, [2 x i64] } %6, { i8 addrspace(1)*, i64, [2 x i64] } %7, i64 signext %8) local_unnamed_addr {
entry:
  %9 = alloca [1 x i64], align 8
  %10 = alloca [1 x i64], align 8
  %11 = alloca [1 x i64], align 8
  %12 = alloca [1 x i64], align 8
  %13 = alloca [1 x i64], align 8
  %14 = alloca [2 x i64], align 8
  %15 = alloca [1 x i64], align 8
  %16 = alloca [1 x i64], align 8
  %17 = alloca [2 x i64], align 8
  %18 = alloca [2 x i64], align 8
  %19 = alloca { i8 addrspace(1)*, i64, [1 x i64] }, align 8
  %.fca.0.extract24 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %3, 0
  %.fca.0.gep25 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %19, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract24, i8 addrspace(1)** %.fca.0.gep25, align 8
  %.fca.1.extract26 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %3, 1
  %.fca.1.gep27 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %19, i64 0, i32 1
  store i64 %.fca.1.extract26, i64* %.fca.1.gep27, align 8
  %.fca.2.0.extract28 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %3, 2, 0
  %.fca.2.0.gep29 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %19, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract28, i64* %.fca.2.0.gep29, align 8
  %20 = alloca { i8 addrspace(1)*, i64, [1 x i64] }, align 8
  %.fca.0.extract18 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %4, 0
  %.fca.0.gep19 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %20, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract18, i8 addrspace(1)** %.fca.0.gep19, align 8
  %.fca.1.extract20 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %4, 1
  %.fca.1.gep21 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %20, i64 0, i32 1
  store i64 %.fca.1.extract20, i64* %.fca.1.gep21, align 8
  %.fca.2.0.extract22 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %4, 2, 0
  %.fca.2.0.gep23 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %20, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract22, i64* %.fca.2.0.gep23, align 8
  %21 = alloca { i8 addrspace(1)*, i64, [1 x i64] }, align 8
  %.fca.0.extract12 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %5, 0
  %.fca.0.gep13 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %21, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract12, i8 addrspace(1)** %.fca.0.gep13, align 8
  %.fca.1.extract14 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %5, 1
  %.fca.1.gep15 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %21, i64 0, i32 1
  store i64 %.fca.1.extract14, i64* %.fca.1.gep15, align 8
  %.fca.2.0.extract16 = extractvalue { i8 addrspace(1)*, i64, [1 x i64] } %5, 2, 0
  %.fca.2.0.gep17 = getelementptr inbounds { i8 addrspace(1)*, i64, [1 x i64] }, { i8 addrspace(1)*, i64, [1 x i64] }* %21, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract16, i64* %.fca.2.0.gep17, align 8
  %22 = alloca { i8 addrspace(1)*, i64, [2 x i64] }, align 8
  %.fca.0.extract4 = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %6, 0
  %.fca.0.gep5 = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %22, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract4, i8 addrspace(1)** %.fca.0.gep5, align 8
  %.fca.1.extract6 = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %6, 1
  %.fca.1.gep7 = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %22, i64 0, i32 1
  store i64 %.fca.1.extract6, i64* %.fca.1.gep7, align 8
  %.fca.2.0.extract8 = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %6, 2, 0
  %.fca.2.0.gep9 = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %22, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract8, i64* %.fca.2.0.gep9, align 8
  %.fca.2.1.extract10 = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %6, 2, 1
  %.fca.2.1.gep11 = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %22, i64 0, i32 2, i64 1
  store i64 %.fca.2.1.extract10, i64* %.fca.2.1.gep11, align 8
  %23 = alloca { i8 addrspace(1)*, i64, [2 x i64] }, align 8
  %.fca.0.extract = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %7, 0
  %.fca.0.gep = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %23, i64 0, i32 0
  store i8 addrspace(1)* %.fca.0.extract, i8 addrspace(1)** %.fca.0.gep, align 8
  %.fca.1.extract = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %7, 1
  %.fca.1.gep = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %23, i64 0, i32 1
  store i64 %.fca.1.extract, i64* %.fca.1.gep, align 8
  %.fca.2.0.extract = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %7, 2, 0
  %.fca.2.0.gep = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %23, i64 0, i32 2, i64 0
  store i64 %.fca.2.0.extract, i64* %.fca.2.0.gep, align 8
  %.fca.2.1.extract = extractvalue { i8 addrspace(1)*, i64, [2 x i64] } %7, 2, 1
  %.fca.2.1.gep = getelementptr inbounds { i8 addrspace(1)*, i64, [2 x i64] }, { i8 addrspace(1)*, i64, [2 x i64] }* %23, i64 0, i32 2, i64 1
  store i64 %.fca.2.1.extract, i64* %.fca.2.1.gep, align 8
  %24 = bitcast [1 x i64]* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %24)
  %25 = bitcast [1 x i64]* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %25)
  %26 = bitcast [1 x i64]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %26)
  %27 = bitcast [1 x i64]* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %27)
  %28 = bitcast [1 x i64]* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %28)
  %29 = bitcast [2 x i64]* %14 to i8*
  call void @llvm.lzoomifetime.start.p0i8(i64 16, i8* nonnull %29)
  %30 = bitcast [1 x i64]* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %30)
  %31 = bitcast [1 x i64]* %16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %31)
  %32 = bitcast [2 x i64]* %17 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %32)
  %33 = bitcast [2 x i64]* %18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %33)
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:16 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:83 within `blockDim'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:51 within `blockDim_y'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `_index'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
      %34 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.y()
; ││└└
; ││┌ @ boot.jl:752 within `Int64'
; │││┌ @ boot.jl:676 within `toInt64'
      %35 = zext i32 %34 to i64
; └└└└
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:76 within `blockIdx'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:56 within `blockIdx_x'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `_index'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
      %36 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
; ││└└
; ││┌ @ int.jl:87 within `+'
     %narrow = add nuw nsw i32 %36, 1
     %37 = zext i32 %narrow to i64
; └└└
; ┌ @ int.jl:88 within `*'
   %38 = mul nuw nsw i64 %37, %35
; └
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:90 within `threadIdx'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:46 within `threadIdx_y'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `_index'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
      %39 = call i32 @llvm.nvvm.read.ptx.sreg.tid.y()
; ││└└
; ││┌ @ int.jl:87 within `+'
     %narrow34 = add nuw nsw i32 %39, 1
     %40 = zext i32 %narrow34 to i64
; └└└
; ┌ @ int.jl:87 within `+'
   %41 = add nuw nsw i64 %38, %40
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:17 within `SpMM_der0'
; ┌ @ int.jl:442 within `<='
   %.not = icmp sgt i64 %41, %0
; └
  %42 = bitcast i8 addrspace(1)* %.fca.0.extract24 to i64 addrspace(1)*
  %43 = bitcast i8 addrspace(1)* %.fca.0.extract18 to i64 addrspace(1)*
  %44 = bitcast i8 addrspace(1)* %.fca.0.extract12 to double addrspace(1)*
  %45 = bitcast i8 addrspace(1)* %.fca.0.extract4 to double addrspace(1)*
  %46 = bitcast i8 addrspace(1)* %.fca.0.extract to double addrspace(1)*
  br i1 %.not, label %_Z20julia_SpMM_der0_25255Int64S_S_13CuDeviceArrayIS_Li1ELi1EES0_IS_Li1ELi1EES0_I7Float64Li1ELi1EES0_IS1_Li2ELi1EES0_IS1_Li2ELi1EES_.inner.exit, label %L37.i

L37.i:                                            ; preds = %entry
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:18 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:76 within `blockIdx'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:56 within `blockIdx_y'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `_index'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
      %47 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.y()
; └└└└
; ┌ @ int.jl:464 within `<<' @ int.jl:457
   %narrow35 = shl nuw nsw i32 %47, 5
; └
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:90 within `threadIdx'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:46 within `threadIdx_x'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `_index'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
      %48 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
; └└└└
; ┌ @ int.jl:87 within `+'
   %narrow36 = add nuw nsw i32 %48, 33
   %narrow37 = add nuw nsw i32 %narrow36, %narrow35
   %49 = zext i32 %narrow37 to i64
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:19 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    %50 = getelementptr inbounds [1 x i64], [1 x i64]* %9, i64 0, i64 0
    store i64 %41, i64* %50, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:312 within `eachindex'
; ││││┌ @ abstractarray.jl:109 within `axes1'
; │││││┌ @ abstractarray.jl:89 within `axes'
; ││││││┌ @ tuple.jl:213 within `map'
; │││││││┌ @ range.jl:337 within `oneto'
; ││││││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; │││││││││┌ @ promotion.jl:421 within `max'
            %51 = icmp sgt i64 %.fca.2.0.extract28, 0
            %52 = select i1 %51, i64 %.fca.2.0.extract28, i64 0
; │││└└└└└└└
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %.not38 = icmp sgt i64 %41, %52
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     br i1 %.not38, label %L78.i, label %L77.i

L77.i:                                            ; preds = %L78.i, %L37.i
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││┌ @ int.jl:86 within `-'
         %53 = add nsw i64 %41, -1
; ││││││└
        %54 = getelementptr inbounds i64, i64 addrspace(1)* %42, i64 %53
        %55 = load i64, i64 addrspace(1)* %54, align 8
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:20 within `SpMM_der0'
; ┌ @ int.jl:87 within `+'
   %56 = add nuw nsw i64 %41, 1
; └
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    %57 = getelementptr inbounds [1 x i64], [1 x i64]* %10, i64 0, i64 0
    store i64 %56, i64* %57, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %.not39 = icmp slt i64 %41, %52
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     br i1 %.not39, label %L99.i, label %L100.i

L78.i:                                            ; preds = %L37.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:19 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2571() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L77.i

L99.i:                                            ; preds = %L100.i, %L77.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:20 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %58 = getelementptr inbounds i64, i64 addrspace(1)* %42, i64 %41
        %59 = load i64, i64 addrspace(1)* %58, align 8
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:23 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:76 within `blockIdx'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:56 within `blockIdx_y'
; ││┌ @ int.jl:87 within `+'
     %narrow40 = add nuw nsw i32 %47, 1
; └└└
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:69 within `gridDim'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:61 within `gridDim_y'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `_index'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\intrinsics\indexing.jl:6 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
      %60 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.y()
; └└└└
; ┌ @ operators.jl:204 within `!='
; │┌ @ promotion.jl:410 within `=='
    %.not41 = icmp eq i32 %narrow40, %60
; └└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl within `SpMM_der0'
  %.not42 = icmp sgt i64 %55, %59
  %61 = add i64 %55, -1
  %62 = select i1 %.not42, i64 %61, i64 %59
  %.not43.not = icmp slt i64 %62, %55
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:23 within `SpMM_der0'
  br i1 %.not41, label %L290.i, label %L134.i

L100.i:                                           ; preds = %L77.i
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:20 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2571() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L99.i

L134.i:                                           ; preds = %L99.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:24 within `SpMM_der0'
  br i1 %.not43.not, label %L229.i, label %L146.i.preheader

L146.i.preheader:                                 ; preds = %L134.i
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:27 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl within `arrayref'
    %63 = getelementptr inbounds [1 x i64], [1 x i64]* %11, i64 0, i64 0
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
            %64 = icmp sgt i64 %.fca.2.0.extract22, 0
            %65 = select i1 %64, i64 %.fca.2.0.extract22, i64 0
; └└└└└└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:28 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl within `arrayref'
    %66 = getelementptr inbounds [1 x i64], [1 x i64]* %12, i64 0, i64 0
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
            %67 = icmp sgt i64 %.fca.2.0.extract16, 0
            %68 = select i1 %67, i64 %.fca.2.0.extract16, i64 0
; │└└└└└└└└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl within `arrayref'
    %69 = getelementptr inbounds [1 x i64], [1 x i64]* %13, i64 0, i64 0
; │└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:311 within `eachindex'
; ││││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:61 within `length'
; │││││┌ @ tuple.jl:480 within `prod'
; ││││││┌ @ int.jl within `*'
         %70 = mul i64 %.fca.2.1.extract10, %.fca.2.0.extract8
; ││││└└└
; ││││┌ @ range.jl:337 within `oneto'
; │││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; ││││││┌ @ promotion.jl within `max'
         %71 = icmp sgt i64 %70, 0
         %72 = select i1 %71, i64 %70, i64 0
; └└└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:27 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     br label %L146.i

L146.i:                                           ; preds = %L205.i, %L146.i.preheader
     %value_phi3.i = phi i64 [ %93, %L205.i ], [ %55, %L146.i.preheader ]
     %value_phi5.i = phi double [ %92, %L205.i ], [ 0.000000e+00, %L146.i.preheader ]
; ││└
    store i64 %value_phi3.i, i64* %63, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %73 = icmp slt i64 %value_phi3.i, 1
       %74 = icmp sgt i64 %value_phi3.i, %65
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %75 = or i1 %73, %74
     br i1 %75, label %L160.i, label %L159.i

L159.i:                                           ; preds = %L160.i, %L146.i
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││┌ @ int.jl:86 within `-'
         %76 = add i64 %value_phi3.i, -1
; ││││││└
        %77 = getelementptr inbounds i64, i64 addrspace(1)* %43, i64 %76
        %78 = load i64, i64 addrspace(1)* %77, align 8
; └└└└└└
; ┌ @ int.jl:88 within `*'
   %79 = mul i64 %78, %2
; └
; ┌ @ int.jl:87 within `+'
   %80 = add i64 %79, %49
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:28 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %value_phi3.i, i64* %66, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %81 = icmp sgt i64 %value_phi3.i, %68
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %82 = or i1 %73, %81
     br i1 %82, label %L183.i, label %L182.i

L160.i:                                           ; preds = %L146.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:27 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2571() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L159.i

L182.i:                                           ; preds = %L183.i, %L159.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:28 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %83 = getelementptr inbounds double, double addrspace(1)* %44, i64 %76
        %84 = load double, double addrspace(1)* %83, align 8
; │└└└└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %80, i64* %69, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %85 = icmp slt i64 %80, 1
       %86 = icmp sgt i64 %80, %72
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %87 = or i1 %85, %86
     br i1 %87, label %L206.i, label %L205.i

L183.i:                                           ; preds = %L159.i
     call fastcc void @julia_throw_boundserror_2574() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L182.i

L205.i:                                           ; preds = %L206.i, %L182.i
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││┌ @ int.jl:86 within `-'
         %88 = add i64 %80, -1
; ││││││└
        %89 = getelementptr inbounds double, double addrspace(1)* %45, i64 %88
        %90 = load double, double addrspace(1)* %89, align 8
; └└└└└└
; ┌ @ float.jl:332 within `*'
   %91 = fmul double %84, %90
; └
; ┌ @ float.jl:326 within `+'
   %92 = fadd double %value_phi5.i, %91
; └
; ┌ @ range.jl:674 within `iterate'
; │┌ @ promotion.jl:410 within `=='
    %.not44.not = icmp eq i64 %value_phi3.i, %62
; │└
   %93 = add i64 %value_phi3.i, 1
; └
  br i1 %.not44.not, label %L229.i, label %L146.i

L206.i:                                           ; preds = %L182.i
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2580() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L205.i

L229.i:                                           ; preds = %L205.i, %L134.i
     %value_phi9.i = phi double [ 0.000000e+00, %L134.i ], [ %92, %L205.i ]
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:31 within `SpMM_der0'
; ┌ @ abstractarray.jl:1267 within `setindex!'
; │┌ @ abstractarray.jl:1289 within `_setindex!'
    %94 = getelementptr inbounds [2 x i64], [2 x i64]* %14, i64 0, i64 0
    store i64 %41, i64* %94, align 8
    %95 = getelementptr inbounds [2 x i64], [2 x i64]* %14, i64 0, i64 1
    store i64 %49, i64* %95, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:595
; │││┌ @ abstractarray.jl:89 within `axes'
; ││││┌ @ tuple.jl:214 within `map'
; │││││┌ @ range.jl:337 within `oneto'
; ││││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; │││││││┌ @ promotion.jl:421 within `max'
          %96 = icmp sgt i64 %.fca.2.0.extract, 0
          %97 = select i1 %96, i64 %.fca.2.0.extract, i64 0
          %98 = icmp sgt i64 %.fca.2.1.extract, 0
          %99 = select i1 %98, i64 %.fca.2.1.extract, i64 0
; │││└└└└└
; │││┌ @ abstractarray.jl:642 within `checkbounds_indices'
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl:442 within `<='
        %100 = icmp sgt i64 %41, %97
; ││││└└
; ││││ @ abstractarray.jl:642 within `checkbounds_indices' @ abstractarray.jl:642
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl:442 within `<='
        %101 = icmp slt i64 %99, %49
; │││└└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %102 = or i1 %100, %101
     br i1 %102, label %L249.i, label %L248.i

L248.i:                                           ; preds = %L249.i, %L229.i
; │└└
; │┌ @ abstractarray.jl:1290 within `_setindex!'
; ││┌ @ abstractarray.jl:1203 within `_to_linear_index'
; │││┌ @ abstractarray.jl:2011 within `_sub2ind' @ abstractarray.jl:2027
; ││││┌ @ abstractarray.jl:2043 within `_sub2ind_recurse' @ abstractarray.jl:2043
; │││││┌ @ abstractarray.jl:2050 within `offsetin'
; ││││││┌ @ int.jl:86 within `-'
         %103 = add nsw i64 %49, -1
; │││││└└
; │││││┌ @ int.jl:88 within `*'
        %104 = mul i64 %97, %103
; ││└└└└
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:192 within `setindex!'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:153 within `arrayset'
; ││││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:162 within `arrayset_bits'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:84 within `unsafe_store!'
; ││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `pointerset'
; │││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││││┌ @ int.jl:86 within `-'
           %105 = add i64 %53, %104
; ││││││││└
          %106 = getelementptr inbounds double, double addrspace(1)* %46, i64 %105
          store double %value_phi9.i, double addrspace(1)* %106, align 8
; └└└└└└└└
  br label %_Z20julia_SpMM_der0_25255Int64S_S_13CuDeviceArrayIS_Li1ELi1EES0_IS_Li1ELi1EES0_I7Float64Li1ELi1EES0_IS1_Li2ELi1EES0_IS1_Li2ELi1EES_.inner.exit

L249.i:                                           ; preds = %L229.i
; ┌ @ abstractarray.jl:1267 within `setindex!'
; │┌ @ abstractarray.jl:1289 within `_setindex!'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2577() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L248.i

L290.i:                                           ; preds = %L99.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:33 within `SpMM_der0'
  br i1 %.not43.not, label %L422.i, label %L302.i.preheader

L302.i.preheader:                                 ; preds = %L290.i
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:34 within `SpMM_der0'
; ┌ @ int.jl within `<='
   %.not45 = icmp sgt i64 %49, %2
; └
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:37 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl within `arrayref'
    %107 = getelementptr inbounds [1 x i64], [1 x i64]* %15, i64 0, i64 0
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
            %108 = icmp sgt i64 %.fca.2.0.extract22, 0
            %109 = select i1 %108, i64 %.fca.2.0.extract22, i64 0
; └└└└└└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:38 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl within `arrayref'
    %110 = getelementptr inbounds [1 x i64], [1 x i64]* %16, i64 0, i64 0
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
            %111 = icmp sgt i64 %.fca.2.0.extract16, 0
            %112 = select i1 %111, i64 %.fca.2.0.extract16, i64 0
; └└└└└└└└└└
; ┌ @ abstractarray.jl:1170 within `getindex'
; │┌ @ abstractarray.jl within `_getindex'
    %113 = getelementptr inbounds [2 x i64], [2 x i64]* %17, i64 0, i64 0
    %114 = getelementptr inbounds [2 x i64], [2 x i64]* %17, i64 0, i64 1
; │└
; │┌ @ abstractarray.jl:1196 within `_getindex'
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:595
; │││┌ @ abstractarray.jl:89 within `axes'
; ││││┌ @ tuple.jl:214 within `map'
; │││││┌ @ range.jl:337 within `oneto'
; ││││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; │││││││┌ @ promotion.jl within `max'
          %115 = icmp sgt i64 %.fca.2.0.extract8, 0
          %116 = select i1 %115, i64 %.fca.2.0.extract8, i64 0
          %117 = icmp sgt i64 %.fca.2.1.extract10, 0
          %118 = select i1 %117, i64 %.fca.2.1.extract10, i64 0
; │││└└└└└
; │││┌ @ abstractarray.jl:642 within `checkbounds_indices' @ abstractarray.jl:642
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl within `<='
        %119 = icmp sge i64 %118, %49
; │└└└└└
; │┌ @ abstractarray.jl:1197 within `_getindex'
; ││┌ @ abstractarray.jl:1203 within `_to_linear_index'
; │││┌ @ abstractarray.jl:2011 within `_sub2ind' @ abstractarray.jl:2027
; ││││┌ @ abstractarray.jl:2043 within `_sub2ind_recurse' @ abstractarray.jl:2043
; │││││┌ @ abstractarray.jl:2050 within `offsetin'
; ││││││┌ @ int.jl within `-'
         %120 = add nsw i64 %49, -1
; │││││└└
; │││││┌ @ int.jl within `*'
        %121 = mul i64 %116, %120
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:34 within `SpMM_der0'
  br i1 %.not45, label %L422.i, label %L307.i

L307.i:                                           ; preds = %L410.i, %L302.i.preheader
  %value_phi17.i = phi i64 [ %142, %L410.i ], [ %55, %L302.i.preheader ]
  %value_phi19.i = phi double [ %141, %L410.i ], [ 0.000000e+00, %L302.i.preheader ]
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:37 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %value_phi17.i, i64* %107, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %122 = icmp slt i64 %value_phi17.i, 1
       %123 = icmp sgt i64 %value_phi17.i, %109
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %124 = or i1 %122, %123
     br i1 %124, label %L318.i, label %L317.i

L317.i:                                           ; preds = %L318.i, %L307.i
; │└└
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││┌ @ int.jl:86 within `-'
         %125 = add i64 %value_phi17.i, -1
; ││││││└
        %126 = getelementptr inbounds i64, i64 addrspace(1)* %43, i64 %125
        %127 = load i64, i64 addrspace(1)* %126, align 8
; └└└└└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:38 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
    store i64 %value_phi17.i, i64* %110, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:601
; │││┌ @ abstractarray.jl:673 within `checkindex'
; ││││┌ @ int.jl:442 within `<='
       %128 = icmp sgt i64 %value_phi17.i, %112
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %129 = or i1 %122, %128
     br i1 %129, label %L339.i, label %L338.i

L318.i:                                           ; preds = %L307.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:37 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2571() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L317.i

L338.i:                                           ; preds = %L339.i, %L317.i
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:38 within `SpMM_der0'
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
        %130 = getelementptr inbounds double, double addrspace(1)* %44, i64 %125
        %131 = load double, double addrspace(1)* %130, align 8
; └└└└└└
; ┌ @ abstractarray.jl:1170 within `getindex'
; │┌ @ abstractarray.jl:1196 within `_getindex'
    store i64 %127, i64* %113, align 8
    store i64 %49, i64* %114, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:595
; │││┌ @ abstractarray.jl:642 within `checkbounds_indices'
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl:442 within `<='
        %132 = icmp sgt i64 %127, 0
        %133 = icmp sle i64 %127, %116
; │││││└
; │││││┌ @ bool.jl:36 within `&'
        %134 = and i1 %132, %133
; ││││└└
; ││││┌ @ bool.jl:36 within `&'
       %135 = and i1 %134, %119
; │││└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     br i1 %135, label %L410.i, label %L368.i

L339.i:                                           ; preds = %L317.i
; └└└
; ┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:109 within `arrayref'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2574() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L338.i

L368.i:                                           ; preds = %L338.i
; └└└
; ┌ @ abstractarray.jl:1170 within `getindex'
; │┌ @ abstractarray.jl:1196 within `_getindex'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2577() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L410.i

L410.i:                                           ; preds = %L368.i, %L338.i
; │└└
; │┌ @ abstractarray.jl:1197 within `_getindex'
; ││┌ @ abstractarray.jl:1203 within `_to_linear_index'
; │││┌ @ abstractarray.jl:2011 within `_sub2ind' @ abstractarray.jl:2027
; ││││┌ @ abstractarray.jl:2043 within `_sub2ind_recurse' @ abstractarray.jl:2043
; │││││┌ @ int.jl:87 within `+'
        %136 = add i64 %127, -1
; ││└└└└
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:190 within `getindex'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:111 within `arrayref'
; ││││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:119 within `arrayref_bits'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:81 within `unsafe_load'
; ││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `pointerref'
; │││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:9 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││││┌ @ int.jl:86 within `-'
           %137 = add i64 %136, %121
; ││││││││└
          %138 = getelementptr inbounds double, double addrspace(1)* %45, i64 %137
          %139 = load double, double addrspace(1)* %138, align 8
; └└└└└└└└
; ┌ @ float.jl:332 within `*'
   %140 = fmul double %131, %139
; └
; ┌ @ float.jl:326 within `+'
   %141 = fadd double %value_phi19.i, %140
; └
; ┌ @ range.jl:674 within `iterate'
; │┌ @ promotion.jl:410 within `=='
    %.not46.not = icmp eq i64 %value_phi17.i, %62
; │└
   %142 = add i64 %value_phi17.i, 1
; └
  br i1 %.not46.not, label %L422.i, label %L307.i

L422.i:                                           ; preds = %L410.i, %L302.i.preheader, %L290.i
  %value_phi24.i = phi double [ 0.000000e+00, %L290.i ], [ 0.000000e+00, %L302.i.preheader ], [ %141, %L410.i ]
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:42 within `SpMM_der0'
; ┌ @ abstractarray.jl:1267 within `setindex!'
; │┌ @ abstractarray.jl:1289 within `_setindex!'
    %143 = getelementptr inbounds [2 x i64], [2 x i64]* %18, i64 0, i64 0
    store i64 %41, i64* %143, align 8
    %144 = getelementptr inbounds [2 x i64], [2 x i64]* %18, i64 0, i64 1
    store i64 %49, i64* %144, align 8
; ││┌ @ abstractarray.jl:616 within `checkbounds' @ abstractarray.jl:595
; │││┌ @ abstractarray.jl:89 within `axes'
; ││││┌ @ tuple.jl:214 within `map'
; │││││┌ @ range.jl:337 within `oneto'
; ││││││┌ @ range.jl:335 within `OneTo' @ range.jl:326
; │││││││┌ @ promotion.jl:421 within `max'
          %145 = icmp sgt i64 %.fca.2.0.extract, 0
          %146 = select i1 %145, i64 %.fca.2.0.extract, i64 0
          %147 = icmp sgt i64 %.fca.2.1.extract, 0
          %148 = select i1 %147, i64 %.fca.2.1.extract, i64 0
; │││└└└└└
; │││┌ @ abstractarray.jl:642 within `checkbounds_indices'
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl:442 within `<='
        %149 = icmp sgt i64 %41, %146
; ││││└└
; ││││ @ abstractarray.jl:642 within `checkbounds_indices' @ abstractarray.jl:642
; ││││┌ @ abstractarray.jl:673 within `checkindex'
; │││││┌ @ int.jl:442 within `<='
        %150 = icmp slt i64 %148, %49
; │││└└└
; │││ @ abstractarray.jl:616 within `checkbounds'
     %151 = or i1 %149, %150
     br i1 %151, label %L442.i, label %L441.i

L441.i:                                           ; preds = %L442.i, %L422.i
; │└└
; │┌ @ abstractarray.jl:1290 within `_setindex!'
; ││┌ @ abstractarray.jl:1203 within `_to_linear_index'
; │││┌ @ abstractarray.jl:2011 within `_sub2ind' @ abstractarray.jl:2027
; ││││┌ @ abstractarray.jl:2043 within `_sub2ind_recurse' @ abstractarray.jl:2043
; │││││┌ @ abstractarray.jl:2050 within `offsetin'
; ││││││┌ @ int.jl:86 within `-'
         %152 = add nsw i64 %49, -1
; │││││└└
; │││││┌ @ int.jl:88 within `*'
        %153 = mul i64 %146, %152
; ││└└└└
; ││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:192 within `setindex!'
; │││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:153 within `arrayset'
; ││││┌ @ C:\Users\oster\.julia\packages\CUDA\lwSps\src\device\array.jl:162 within `arrayset_bits'
; │││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:84 within `unsafe_store!'
; ││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `pointerset'
; │││││││┌ @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\pointer.jl:44 within `macro expansion' @ C:\Users\oster\.julia\packages\LLVM\aqg20\src\interop\base.jl:39
; ││││││││┌ @ int.jl:86 within `-'
           %154 = add i64 %53, %153
; ││││││││└
          %155 = getelementptr inbounds double, double addrspace(1)* %46, i64 %154
          store double %value_phi24.i, double addrspace(1)* %155, align 8
; │└└└└└└└
   br label %_Z20julia_SpMM_der0_25255Int64S_S_13CuDeviceArrayIS_Li1ELi1EES0_IS_Li1ELi1EES0_I7Float64Li1ELi1EES0_IS1_Li2ELi1EES0_IS1_Li2ELi1EES_.inner.exit

L442.i:                                           ; preds = %L422.i
; │┌ @ abstractarray.jl:1289 within `_setindex!'
; ││┌ @ abstractarray.jl:616 within `checkbounds'
     call fastcc void @julia_throw_boundserror_2577() #4
     call void asm sideeffect "trap;", ""() #5
     br label %L441.i

_Z20julia_SpMM_der0_25255Int64S_S_13CuDeviceArrayIS_Li1ELi1EES0_IS_Li1ELi1EES0_I7Float64Li1ELi1EES0_IS1_Li2ELi1EES0_IS1_Li2ELi1EES_.inner.exit: ; preds = %L441.i, %L248.i, %entry
; └└└
;  @ G:\My Drive\School\UofU\proj\ComPact\sparse-matrix\Ge-SpMM_der0.jl:46 within `SpMM_der0'
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %24)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %25)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %26)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %27)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %28)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %29)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %30)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %31)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %32)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %33)
  ret void
}
