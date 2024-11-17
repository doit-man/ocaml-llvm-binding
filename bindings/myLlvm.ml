include Llvm

external set_opaque_pointers : llcontext -> bool -> unit
  = "llvm_set_opaque_pointers"

external verify_module : llmodule -> bool = "wrap_llvm_verify_module"
external get_allocated_type : llvalue -> lltype = "llvm_get_alloca_type"

external clone_function_with_retty : llvalue -> lltype -> llvalue
  = "llvm_transforms_utils_clone_function_with_retty"
(** [clone_function_retty func ret_ty] returns
    a copy of [func] of return type [ret_ty] and add it to [func]'s module *)

external clone_function_with_fnty : llvalue -> lltype -> llvalue
  = "llvm_transforms_utils_clone_function_with_fnty"
(** [clone_function_with_fnty func fn_ty] returns
      a copy of [func] of function type [fn_ty] and add it to [func]'s module *)

external transfer_instructions : llbasicblock -> llbasicblock -> unit
  = "llvm_bb_transfer_instructions"
(** [transfer_instructions src dst] moves all instructions
    from [src] to the end of [dst] *)

external clean_module_data : llmodule -> unit = "llvm_clean_module_data"
(** [clean_module_data m] removes all metadata from [m] *)

external string_of_constint : llvalue -> string = "llvm_string_of_constantint"
(** [string_of_constint v] get value as string from [v] *)

external half_type : llcontext -> lltype = "llvm_half_type"
(** [half_type c] returns the IEEE 16-bit floating point type in the context [c]. See [llvm::Type::HalfTy]. *)

external get_return_type : llvalue -> lltype = "llvm_get_return_type"

external add_intrinsic_by_name : llmodule -> string -> lltype -> llvalue
  = "llvm_get_intrinsic_by_name"
(** [add_intrinsic_by_name llm name fnty] returns the intrinsic function with [fnty]. *)

external get_shufflevector_mask_inner : llvalue -> llvalue
  = "llvm_get_shufflevector_mask"
(** [transfer_instructions src dst] moves all instructions
    from [src] to the end of [dst] *)

external set_shufflevector_mask_inner : llvalue -> llvalue -> unit
  = "llvm_set_shufflevector_mask"
(** [transfer_instructions src dst] moves all instructions
  from [src] to the end of [dst] *)
