��
��
D
AddV2
x"T
y"T
z"T"
Ttype:
2	��
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( �
�
BiasAdd

value"T	
bias"T
output"T""
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
$
DisableCopyOnRead
resource�
^
Fill
dims"
index_type

value"T
output"T"	
Ttype"

index_typetype0:
2	
.
Identity

input"T
output"T"	
Ttype
u
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:
2	
�
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( �
?
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
d
Shape

input"T&
output"out_type��out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
[
Split
	split_dim

value"T
output"T*	num_split"
	num_splitint(0"	
Ttype
�
SplitV

value"T
size_splits"Tlen
	split_dim
output"T*	num_split"
	num_splitint(0"	
Ttype"
Tlentype0	:
2	
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ��
@
StaticRegexFullMatch	
input

output
"
patternstring
�
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
L

StringJoin
inputs*N

output"

Nint("
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	
�
TensorListFromTensor
tensor"element_dtype
element_shape"
shape_type/
output_handle���element_dtype"
element_dtypetype"

shape_typetype:
2	
�
TensorListReserve
element_shape"
shape_type
num_elements(
handle���element_dtype"
element_dtypetype"

shape_typetype:
2	
�
TensorListStack
input_handle
element_shape
tensor"element_dtype"
element_dtypetype" 
num_elementsint���������
P
	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	
P
Unpack

value"T
output"T*num"
numint("	
Ttype"
axisint 
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �
�
While

input2T
output2T"
T
list(type)("
condfunc"
bodyfunc" 
output_shapeslist(shape)
 "
parallel_iterationsint
�"serve*2.13.02v2.13.0-rc2-7-g1cb1a030a628��
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
�
RMSprop/velocity/dense_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*.
shared_nameRMSprop/velocity/dense_5/bias
�
1RMSprop/velocity/dense_5/bias/Read/ReadVariableOpReadVariableOpRMSprop/velocity/dense_5/bias*
_output_shapes
:*
dtype0
�
RMSprop/velocity/dense_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*0
shared_name!RMSprop/velocity/dense_5/kernel
�
3RMSprop/velocity/dense_5/kernel/Read/ReadVariableOpReadVariableOpRMSprop/velocity/dense_5/kernel*
_output_shapes
:	�*
dtype0
�
$RMSprop/velocity/gru_5/gru_cell/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*5
shared_name&$RMSprop/velocity/gru_5/gru_cell/bias
�
8RMSprop/velocity/gru_5/gru_cell/bias/Read/ReadVariableOpReadVariableOp$RMSprop/velocity/gru_5/gru_cell/bias*
_output_shapes
:	�*
dtype0
�
0RMSprop/velocity/gru_5/gru_cell/recurrent_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*A
shared_name20RMSprop/velocity/gru_5/gru_cell/recurrent_kernel
�
DRMSprop/velocity/gru_5/gru_cell/recurrent_kernel/Read/ReadVariableOpReadVariableOp0RMSprop/velocity/gru_5/gru_cell/recurrent_kernel* 
_output_shapes
:
��*
dtype0
�
&RMSprop/velocity/gru_5/gru_cell/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*7
shared_name(&RMSprop/velocity/gru_5/gru_cell/kernel
�
:RMSprop/velocity/gru_5/gru_cell/kernel/Read/ReadVariableOpReadVariableOp&RMSprop/velocity/gru_5/gru_cell/kernel*
_output_shapes
:	�*
dtype0
n
learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namelearning_rate
g
!learning_rate/Read/ReadVariableOpReadVariableOplearning_rate*
_output_shapes
: *
dtype0
f
	iterationVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	iteration
_
iteration/Read/ReadVariableOpReadVariableOp	iteration*
_output_shapes
: *
dtype0	
�
gru_5/gru_cell/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*$
shared_namegru_5/gru_cell/bias
|
'gru_5/gru_cell/bias/Read/ReadVariableOpReadVariableOpgru_5/gru_cell/bias*
_output_shapes
:	�*
dtype0
�
gru_5/gru_cell/recurrent_kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
��*0
shared_name!gru_5/gru_cell/recurrent_kernel
�
3gru_5/gru_cell/recurrent_kernel/Read/ReadVariableOpReadVariableOpgru_5/gru_cell/recurrent_kernel* 
_output_shapes
:
��*
dtype0
�
gru_5/gru_cell/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*&
shared_namegru_5/gru_cell/kernel
�
)gru_5/gru_cell/kernel/Read/ReadVariableOpReadVariableOpgru_5/gru_cell/kernel*
_output_shapes
:	�*
dtype0
p
dense_5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_5/bias
i
 dense_5/bias/Read/ReadVariableOpReadVariableOpdense_5/bias*
_output_shapes
:*
dtype0
y
dense_5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*
shared_namedense_5/kernel
r
"dense_5/kernel/Read/ReadVariableOpReadVariableOpdense_5/kernel*
_output_shapes
:	�*
dtype0
�
serving_default_input_6Placeholder*+
_output_shapes
:���������*
dtype0* 
shape:���������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_6gru_5/gru_cell/biasgru_5/gru_cell/kernelgru_5/gru_cell/recurrent_kerneldense_5/kerneldense_5/bias*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� *,
f'R%
#__inference_signature_wrapper_80341

NoOpNoOp
�&
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�%
value�%B�% B�%
�
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
	_default_save_signature

	optimizer

signatures*
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_random_generator
cell

state_spec*
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias*
'
0
1
2
3
4*
'
0
1
2
3
4*
* 
�
 non_trainable_variables

!layers
"metrics
#layer_regularization_losses
$layer_metrics
	variables
trainable_variables
regularization_losses
__call__
	_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

%trace_0
&trace_1* 

'trace_0
(trace_1* 
* 
�
)
_variables
*_iterations
+_learning_rate
,_index_dict
-_velocities
.
_momentums
/_average_gradients
0_update_step_xla*

1serving_default* 

0
1
2*

0
1
2*
* 
�

2states
3non_trainable_variables

4layers
5metrics
6layer_regularization_losses
7layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
8trace_0
9trace_1
:trace_2
;trace_3* 
6
<trace_0
=trace_1
>trace_2
?trace_3* 
* 
�
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
D__call__
*E&call_and_return_all_conditional_losses
F_random_generator

kernel
recurrent_kernel
bias*
* 

0
1*

0
1*
* 
�
Gnon_trainable_variables

Hlayers
Imetrics
Jlayer_regularization_losses
Klayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Ltrace_0* 

Mtrace_0* 
^X
VARIABLE_VALUEdense_5/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_5/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEgru_5/gru_cell/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEgru_5/gru_cell/recurrent_kernel&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEgru_5/gru_cell/bias&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
* 

0
1*

N0
O1*
* 
* 
* 
* 
* 
* 
.
*0
P1
Q2
R3
S4
T5*
SM
VARIABLE_VALUE	iteration0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUElearning_rate3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUE*
* 
'
P0
Q1
R2
S3
T4*
* 
* 
* 
* 
* 
* 

0*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

0
1
2*

0
1
2*
* 
�
Unon_trainable_variables

Vlayers
Wmetrics
Xlayer_regularization_losses
Ylayer_metrics
@	variables
Atrainable_variables
Bregularization_losses
D__call__
*E&call_and_return_all_conditional_losses
&E"call_and_return_conditional_losses*

Ztrace_0
[trace_1* 

\trace_0
]trace_1* 
* 
* 
* 
* 
* 
* 
* 
* 
8
^	variables
_	keras_api
	`total
	acount*
H
b	variables
c	keras_api
	dtotal
	ecount
f
_fn_kwargs*
qk
VARIABLE_VALUE&RMSprop/velocity/gru_5/gru_cell/kernel1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUE*
{u
VARIABLE_VALUE0RMSprop/velocity/gru_5/gru_cell/recurrent_kernel1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUE*
oi
VARIABLE_VALUE$RMSprop/velocity/gru_5/gru_cell/bias1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUE*
jd
VARIABLE_VALUERMSprop/velocity/dense_5/kernel1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUE*
hb
VARIABLE_VALUERMSprop/velocity/dense_5/bias1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 
* 
* 
* 
* 
* 
* 

`0
a1*

^	variables*
UO
VARIABLE_VALUEtotal_14keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE*
UO
VARIABLE_VALUEcount_14keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE*

d0
e1*

b	variables*
SM
VARIABLE_VALUEtotal4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEcount4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE*
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filenamedense_5/kerneldense_5/biasgru_5/gru_cell/kernelgru_5/gru_cell/recurrent_kernelgru_5/gru_cell/bias	iterationlearning_rate&RMSprop/velocity/gru_5/gru_cell/kernel0RMSprop/velocity/gru_5/gru_cell/recurrent_kernel$RMSprop/velocity/gru_5/gru_cell/biasRMSprop/velocity/dense_5/kernelRMSprop/velocity/dense_5/biastotal_1count_1totalcountConst*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *'
f"R 
__inference__traced_save_81248
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamedense_5/kerneldense_5/biasgru_5/gru_cell/kernelgru_5/gru_cell/recurrent_kernelgru_5/gru_cell/bias	iterationlearning_rate&RMSprop/velocity/gru_5/gru_cell/kernel0RMSprop/velocity/gru_5/gru_cell/recurrent_kernel$RMSprop/velocity/gru_5/gru_cell/biasRMSprop/velocity/dense_5/kernelRMSprop/velocity/dense_5/biastotal_1count_1totalcount*
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� **
f%R#
!__inference__traced_restore_81305��
�	
�
#__inference_signature_wrapper_80341
input_6
unknown:	�
	unknown_0:	�
	unknown_1:
��
	unknown_2:	�
	unknown_3:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_6unknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� *)
f$R"
 __inference__wrapped_model_79572o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:���������: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name80337:%!

_user_specified_name80335:%!

_user_specified_name80333:%!

_user_specified_name80331:%!

_user_specified_name80329:T P
+
_output_shapes
:���������
!
_user_specified_name	input_6
�W
�
#sequential_5_gru_5_while_body_79476B
>sequential_5_gru_5_while_sequential_5_gru_5_while_loop_counterH
Dsequential_5_gru_5_while_sequential_5_gru_5_while_maximum_iterations(
$sequential_5_gru_5_while_placeholder*
&sequential_5_gru_5_while_placeholder_1*
&sequential_5_gru_5_while_placeholder_2A
=sequential_5_gru_5_while_sequential_5_gru_5_strided_slice_1_0}
ysequential_5_gru_5_while_tensorarrayv2read_tensorlistgetitem_sequential_5_gru_5_tensorarrayunstack_tensorlistfromtensor_0N
;sequential_5_gru_5_while_gru_cell_readvariableop_resource_0:	�U
Bsequential_5_gru_5_while_gru_cell_matmul_readvariableop_resource_0:	�X
Dsequential_5_gru_5_while_gru_cell_matmul_1_readvariableop_resource_0:
��%
!sequential_5_gru_5_while_identity'
#sequential_5_gru_5_while_identity_1'
#sequential_5_gru_5_while_identity_2'
#sequential_5_gru_5_while_identity_3'
#sequential_5_gru_5_while_identity_4?
;sequential_5_gru_5_while_sequential_5_gru_5_strided_slice_1{
wsequential_5_gru_5_while_tensorarrayv2read_tensorlistgetitem_sequential_5_gru_5_tensorarrayunstack_tensorlistfromtensorL
9sequential_5_gru_5_while_gru_cell_readvariableop_resource:	�S
@sequential_5_gru_5_while_gru_cell_matmul_readvariableop_resource:	�V
Bsequential_5_gru_5_while_gru_cell_matmul_1_readvariableop_resource:
����7sequential_5/gru_5/while/gru_cell/MatMul/ReadVariableOp�9sequential_5/gru_5/while/gru_cell/MatMul_1/ReadVariableOp�0sequential_5/gru_5/while/gru_cell/ReadVariableOp�
Jsequential_5/gru_5/while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
<sequential_5/gru_5/while/TensorArrayV2Read/TensorListGetItemTensorListGetItemysequential_5_gru_5_while_tensorarrayv2read_tensorlistgetitem_sequential_5_gru_5_tensorarrayunstack_tensorlistfromtensor_0$sequential_5_gru_5_while_placeholderSsequential_5/gru_5/while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0�
0sequential_5/gru_5/while/gru_cell/ReadVariableOpReadVariableOp;sequential_5_gru_5_while_gru_cell_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
)sequential_5/gru_5/while/gru_cell/unstackUnpack8sequential_5/gru_5/while/gru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
7sequential_5/gru_5/while/gru_cell/MatMul/ReadVariableOpReadVariableOpBsequential_5_gru_5_while_gru_cell_matmul_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
(sequential_5/gru_5/while/gru_cell/MatMulMatMulCsequential_5/gru_5/while/TensorArrayV2Read/TensorListGetItem:item:0?sequential_5/gru_5/while/gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
)sequential_5/gru_5/while/gru_cell/BiasAddBiasAdd2sequential_5/gru_5/while/gru_cell/MatMul:product:02sequential_5/gru_5/while/gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������|
1sequential_5/gru_5/while/gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
'sequential_5/gru_5/while/gru_cell/splitSplit:sequential_5/gru_5/while/gru_cell/split/split_dim:output:02sequential_5/gru_5/while/gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
9sequential_5/gru_5/while/gru_cell/MatMul_1/ReadVariableOpReadVariableOpDsequential_5_gru_5_while_gru_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
��*
dtype0�
*sequential_5/gru_5/while/gru_cell/MatMul_1MatMul&sequential_5_gru_5_while_placeholder_2Asequential_5/gru_5/while/gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
+sequential_5/gru_5/while/gru_cell/BiasAdd_1BiasAdd4sequential_5/gru_5/while/gru_cell/MatMul_1:product:02sequential_5/gru_5/while/gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������|
'sequential_5/gru_5/while/gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����~
3sequential_5/gru_5/while/gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
)sequential_5/gru_5/while/gru_cell/split_1SplitV4sequential_5/gru_5/while/gru_cell/BiasAdd_1:output:00sequential_5/gru_5/while/gru_cell/Const:output:0<sequential_5/gru_5/while/gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
%sequential_5/gru_5/while/gru_cell/addAddV20sequential_5/gru_5/while/gru_cell/split:output:02sequential_5/gru_5/while/gru_cell/split_1:output:0*
T0*(
_output_shapes
:�����������
)sequential_5/gru_5/while/gru_cell/SigmoidSigmoid)sequential_5/gru_5/while/gru_cell/add:z:0*
T0*(
_output_shapes
:�����������
'sequential_5/gru_5/while/gru_cell/add_1AddV20sequential_5/gru_5/while/gru_cell/split:output:12sequential_5/gru_5/while/gru_cell/split_1:output:1*
T0*(
_output_shapes
:�����������
+sequential_5/gru_5/while/gru_cell/Sigmoid_1Sigmoid+sequential_5/gru_5/while/gru_cell/add_1:z:0*
T0*(
_output_shapes
:�����������
%sequential_5/gru_5/while/gru_cell/mulMul/sequential_5/gru_5/while/gru_cell/Sigmoid_1:y:02sequential_5/gru_5/while/gru_cell/split_1:output:2*
T0*(
_output_shapes
:�����������
'sequential_5/gru_5/while/gru_cell/add_2AddV20sequential_5/gru_5/while/gru_cell/split:output:2)sequential_5/gru_5/while/gru_cell/mul:z:0*
T0*(
_output_shapes
:�����������
&sequential_5/gru_5/while/gru_cell/ReluRelu+sequential_5/gru_5/while/gru_cell/add_2:z:0*
T0*(
_output_shapes
:�����������
'sequential_5/gru_5/while/gru_cell/mul_1Mul-sequential_5/gru_5/while/gru_cell/Sigmoid:y:0&sequential_5_gru_5_while_placeholder_2*
T0*(
_output_shapes
:����������l
'sequential_5/gru_5/while/gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
%sequential_5/gru_5/while/gru_cell/subSub0sequential_5/gru_5/while/gru_cell/sub/x:output:0-sequential_5/gru_5/while/gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
'sequential_5/gru_5/while/gru_cell/mul_2Mul)sequential_5/gru_5/while/gru_cell/sub:z:04sequential_5/gru_5/while/gru_cell/Relu:activations:0*
T0*(
_output_shapes
:�����������
'sequential_5/gru_5/while/gru_cell/add_3AddV2+sequential_5/gru_5/while/gru_cell/mul_1:z:0+sequential_5/gru_5/while/gru_cell/mul_2:z:0*
T0*(
_output_shapes
:�����������
Csequential_5/gru_5/while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
=sequential_5/gru_5/while/TensorArrayV2Write/TensorListSetItemTensorListSetItem&sequential_5_gru_5_while_placeholder_1Lsequential_5/gru_5/while/TensorArrayV2Write/TensorListSetItem/index:output:0+sequential_5/gru_5/while/gru_cell/add_3:z:0*
_output_shapes
: *
element_dtype0:���`
sequential_5/gru_5/while/add/yConst*
_output_shapes
: *
dtype0*
value	B :�
sequential_5/gru_5/while/addAddV2$sequential_5_gru_5_while_placeholder'sequential_5/gru_5/while/add/y:output:0*
T0*
_output_shapes
: b
 sequential_5/gru_5/while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :�
sequential_5/gru_5/while/add_1AddV2>sequential_5_gru_5_while_sequential_5_gru_5_while_loop_counter)sequential_5/gru_5/while/add_1/y:output:0*
T0*
_output_shapes
: �
!sequential_5/gru_5/while/IdentityIdentity"sequential_5/gru_5/while/add_1:z:0^sequential_5/gru_5/while/NoOp*
T0*
_output_shapes
: �
#sequential_5/gru_5/while/Identity_1IdentityDsequential_5_gru_5_while_sequential_5_gru_5_while_maximum_iterations^sequential_5/gru_5/while/NoOp*
T0*
_output_shapes
: �
#sequential_5/gru_5/while/Identity_2Identity sequential_5/gru_5/while/add:z:0^sequential_5/gru_5/while/NoOp*
T0*
_output_shapes
: �
#sequential_5/gru_5/while/Identity_3IdentityMsequential_5/gru_5/while/TensorArrayV2Write/TensorListSetItem:output_handle:0^sequential_5/gru_5/while/NoOp*
T0*
_output_shapes
: �
#sequential_5/gru_5/while/Identity_4Identity+sequential_5/gru_5/while/gru_cell/add_3:z:0^sequential_5/gru_5/while/NoOp*
T0*(
_output_shapes
:�����������
sequential_5/gru_5/while/NoOpNoOp8^sequential_5/gru_5/while/gru_cell/MatMul/ReadVariableOp:^sequential_5/gru_5/while/gru_cell/MatMul_1/ReadVariableOp1^sequential_5/gru_5/while/gru_cell/ReadVariableOp*
_output_shapes
 "�
Bsequential_5_gru_5_while_gru_cell_matmul_1_readvariableop_resourceDsequential_5_gru_5_while_gru_cell_matmul_1_readvariableop_resource_0"�
@sequential_5_gru_5_while_gru_cell_matmul_readvariableop_resourceBsequential_5_gru_5_while_gru_cell_matmul_readvariableop_resource_0"x
9sequential_5_gru_5_while_gru_cell_readvariableop_resource;sequential_5_gru_5_while_gru_cell_readvariableop_resource_0"S
#sequential_5_gru_5_while_identity_1,sequential_5/gru_5/while/Identity_1:output:0"S
#sequential_5_gru_5_while_identity_2,sequential_5/gru_5/while/Identity_2:output:0"S
#sequential_5_gru_5_while_identity_3,sequential_5/gru_5/while/Identity_3:output:0"S
#sequential_5_gru_5_while_identity_4,sequential_5/gru_5/while/Identity_4:output:0"O
!sequential_5_gru_5_while_identity*sequential_5/gru_5/while/Identity:output:0"|
;sequential_5_gru_5_while_sequential_5_gru_5_strided_slice_1=sequential_5_gru_5_while_sequential_5_gru_5_strided_slice_1_0"�
wsequential_5_gru_5_while_tensorarrayv2read_tensorlistgetitem_sequential_5_gru_5_tensorarrayunstack_tensorlistfromtensorysequential_5_gru_5_while_tensorarrayv2read_tensorlistgetitem_sequential_5_gru_5_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&: : : : :����������: : : : : 2r
7sequential_5/gru_5/while/gru_cell/MatMul/ReadVariableOp7sequential_5/gru_5/while/gru_cell/MatMul/ReadVariableOp2v
9sequential_5/gru_5/while/gru_cell/MatMul_1/ReadVariableOp9sequential_5/gru_5/while/gru_cell/MatMul_1/ReadVariableOp2d
0sequential_5/gru_5/while/gru_cell/ReadVariableOp0sequential_5/gru_5/while/gru_cell/ReadVariableOp:(	$
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:rn

_output_shapes
: 
T
_user_specified_name<:sequential_5/gru_5/TensorArrayUnstack/TensorListFromTensor:ZV

_output_shapes
: 
<
_user_specified_name$"sequential_5/gru_5/strided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :c_

_output_shapes
: 
E
_user_specified_name-+sequential_5/gru_5/while/maximum_iterations:] Y

_output_shapes
: 
?
_user_specified_name'%sequential_5/gru_5/while/loop_counter
�N
�

!__inference__traced_restore_81305
file_prefix2
assignvariableop_dense_5_kernel:	�-
assignvariableop_1_dense_5_bias:;
(assignvariableop_2_gru_5_gru_cell_kernel:	�F
2assignvariableop_3_gru_5_gru_cell_recurrent_kernel:
��9
&assignvariableop_4_gru_5_gru_cell_bias:	�&
assignvariableop_5_iteration:	 *
 assignvariableop_6_learning_rate: L
9assignvariableop_7_rmsprop_velocity_gru_5_gru_cell_kernel:	�W
Cassignvariableop_8_rmsprop_velocity_gru_5_gru_cell_recurrent_kernel:
��J
7assignvariableop_9_rmsprop_velocity_gru_5_gru_cell_bias:	�F
3assignvariableop_10_rmsprop_velocity_dense_5_kernel:	�?
1assignvariableop_11_rmsprop_velocity_dense_5_bias:%
assignvariableop_12_total_1: %
assignvariableop_13_count_1: #
assignvariableop_14_total: #
assignvariableop_15_count: 
identity_17��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_2�AssignVariableOp_3�AssignVariableOp_4�AssignVariableOp_5�AssignVariableOp_6�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*5
value,B*B B B B B B B B B B B B B B B B B �
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*X
_output_shapesF
D:::::::::::::::::*
dtypes
2	[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOpAssignVariableOpassignvariableop_dense_5_kernelIdentity:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_1AssignVariableOpassignvariableop_1_dense_5_biasIdentity_1:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_2AssignVariableOp(assignvariableop_2_gru_5_gru_cell_kernelIdentity_2:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_3AssignVariableOp2assignvariableop_3_gru_5_gru_cell_recurrent_kernelIdentity_3:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_4AssignVariableOp&assignvariableop_4_gru_5_gru_cell_biasIdentity_4:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0	*
_output_shapes
:�
AssignVariableOp_5AssignVariableOpassignvariableop_5_iterationIdentity_5:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0	]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_6AssignVariableOp assignvariableop_6_learning_rateIdentity_6:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_7AssignVariableOp9assignvariableop_7_rmsprop_velocity_gru_5_gru_cell_kernelIdentity_7:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_8AssignVariableOpCassignvariableop_8_rmsprop_velocity_gru_5_gru_cell_recurrent_kernelIdentity_8:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_9AssignVariableOp7assignvariableop_9_rmsprop_velocity_gru_5_gru_cell_biasIdentity_9:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_10AssignVariableOp3assignvariableop_10_rmsprop_velocity_dense_5_kernelIdentity_10:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_11AssignVariableOp1assignvariableop_11_rmsprop_velocity_dense_5_biasIdentity_11:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_12AssignVariableOpassignvariableop_12_total_1Identity_12:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_13AssignVariableOpassignvariableop_13_count_1Identity_13:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_14AssignVariableOpassignvariableop_14_totalIdentity_14:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:�
AssignVariableOp_15AssignVariableOpassignvariableop_15_countIdentity_15:output:0"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtype0Y
NoOpNoOp"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 �
Identity_16Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_17IdentityIdentity_16:output:0^NoOp_1*
T0*
_output_shapes
: �
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*
_output_shapes
 "#
identity_17Identity_17:output:0*(
_construction_contextkEagerRuntime*5
_input_shapes$
": : : : : : : : : : : : : : : : : 2*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152(
AssignVariableOp_1AssignVariableOp_12(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_92$
AssignVariableOpAssignVariableOp:%!

_user_specified_namecount:%!

_user_specified_nametotal:'#
!
_user_specified_name	count_1:'#
!
_user_specified_name	total_1:=9
7
_user_specified_nameRMSprop/velocity/dense_5/bias:?;
9
_user_specified_name!RMSprop/velocity/dense_5/kernel:D
@
>
_user_specified_name&$RMSprop/velocity/gru_5/gru_cell/bias:P	L
J
_user_specified_name20RMSprop/velocity/gru_5/gru_cell/recurrent_kernel:FB
@
_user_specified_name(&RMSprop/velocity/gru_5/gru_cell/kernel:-)
'
_user_specified_namelearning_rate:)%
#
_user_specified_name	iteration:3/
-
_user_specified_namegru_5/gru_cell/bias:?;
9
_user_specified_name!gru_5/gru_cell/recurrent_kernel:51
/
_user_specified_namegru_5/gru_cell/kernel:,(
&
_user_specified_namedense_5/bias:.*
(
_user_specified_namedense_5/kernel:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
�
%__inference_gru_5_layer_call_fn_80374

inputs
unknown:	�
	unknown_0:	�
	unknown_1:
��
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_gru_5_layer_call_and_return_conditional_losses_80067p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������: : : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name80370:%!

_user_specified_name80368:%!

_user_specified_name80366:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�>
�
while_body_80915
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0;
(while_gru_cell_readvariableop_resource_0:	�B
/while_gru_cell_matmul_readvariableop_resource_0:	�E
1while_gru_cell_matmul_1_readvariableop_resource_0:
��
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor9
&while_gru_cell_readvariableop_resource:	�@
-while_gru_cell_matmul_readvariableop_resource:	�C
/while_gru_cell_matmul_1_readvariableop_resource:
����$while/gru_cell/MatMul/ReadVariableOp�&while/gru_cell/MatMul_1/ReadVariableOp�while/gru_cell/ReadVariableOp�
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0�
while/gru_cell/ReadVariableOpReadVariableOp(while_gru_cell_readvariableop_resource_0*
_output_shapes
:	�*
dtype0
while/gru_cell/unstackUnpack%while/gru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
$while/gru_cell/MatMul/ReadVariableOpReadVariableOp/while_gru_cell_matmul_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
while/gru_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0,while/gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAddBiasAddwhile/gru_cell/MatMul:product:0while/gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������i
while/gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/splitSplit'while/gru_cell/split/split_dim:output:0while/gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
&while/gru_cell/MatMul_1/ReadVariableOpReadVariableOp1while_gru_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
��*
dtype0�
while/gru_cell/MatMul_1MatMulwhile_placeholder_2.while/gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAdd_1BiasAdd!while/gru_cell/MatMul_1:product:0while/gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������i
while/gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����k
 while/gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/split_1SplitV!while/gru_cell/BiasAdd_1:output:0while/gru_cell/Const:output:0)while/gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
while/gru_cell/addAddV2while/gru_cell/split:output:0while/gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������l
while/gru_cell/SigmoidSigmoidwhile/gru_cell/add:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_1AddV2while/gru_cell/split:output:1while/gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������p
while/gru_cell/Sigmoid_1Sigmoidwhile/gru_cell/add_1:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mulMulwhile/gru_cell/Sigmoid_1:y:0while/gru_cell/split_1:output:2*
T0*(
_output_shapes
:�����������
while/gru_cell/add_2AddV2while/gru_cell/split:output:2while/gru_cell/mul:z:0*
T0*(
_output_shapes
:����������h
while/gru_cell/ReluReluwhile/gru_cell/add_2:z:0*
T0*(
_output_shapes
:����������
while/gru_cell/mul_1Mulwhile/gru_cell/Sigmoid:y:0while_placeholder_2*
T0*(
_output_shapes
:����������Y
while/gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
while/gru_cell/subSubwhile/gru_cell/sub/x:output:0while/gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mul_2Mulwhile/gru_cell/sub:z:0!while/gru_cell/Relu:activations:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_3AddV2while/gru_cell/mul_1:z:0while/gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������r
0while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_19while/TensorArrayV2Write/TensorListSetItem/index:output:0while/gru_cell/add_3:z:0*
_output_shapes
: *
element_dtype0:���M
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: v
while/Identity_4Identitywhile/gru_cell/add_3:z:0^while/NoOp*
T0*(
_output_shapes
:�����������

while/NoOpNoOp%^while/gru_cell/MatMul/ReadVariableOp'^while/gru_cell/MatMul_1/ReadVariableOp^while/gru_cell/ReadVariableOp*
_output_shapes
 "d
/while_gru_cell_matmul_1_readvariableop_resource1while_gru_cell_matmul_1_readvariableop_resource_0"`
-while_gru_cell_matmul_readvariableop_resource/while_gru_cell_matmul_readvariableop_resource_0"R
&while_gru_cell_readvariableop_resource(while_gru_cell_readvariableop_resource_0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0")
while_identitywhile/Identity:output:0"0
while_strided_slice_1while_strided_slice_1_0"�
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&: : : : :����������: : : : : 2L
$while/gru_cell/MatMul/ReadVariableOp$while/gru_cell/MatMul/ReadVariableOp2P
&while/gru_cell/MatMul_1/ReadVariableOp&while/gru_cell/MatMul_1/ReadVariableOp2>
while/gru_cell/ReadVariableOpwhile/gru_cell/ReadVariableOp:(	$
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:_[

_output_shapes
: 
A
_user_specified_name)'TensorArrayUnstack/TensorListFromTensor:GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�M
�
@__inference_gru_5_layer_call_and_return_conditional_losses_80850

inputs3
 gru_cell_readvariableop_resource:	�:
'gru_cell_matmul_readvariableop_resource:	�=
)gru_cell_matmul_1_readvariableop_resource:
��
identity��gru_cell/MatMul/ReadVariableOp� gru_cell/MatMul_1/ReadVariableOp�gru_cell/ReadVariableOp�whileI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :�s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:����������c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:���������R
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
::��_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
����������
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_masky
gru_cell/ReadVariableOpReadVariableOp gru_cell_readvariableop_resource*
_output_shapes
:	�*
dtype0s
gru_cell/unstackUnpackgru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
gru_cell/MatMul/ReadVariableOpReadVariableOp'gru_cell_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
gru_cell/MatMulMatMulstrided_slice_2:output:0&gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAddBiasAddgru_cell/MatMul:product:0gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������c
gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/splitSplit!gru_cell/split/split_dim:output:0gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
 gru_cell/MatMul_1/ReadVariableOpReadVariableOp)gru_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
gru_cell/MatMul_1MatMulzeros:output:0(gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAdd_1BiasAddgru_cell/MatMul_1:product:0gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������c
gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����e
gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/split_1SplitVgru_cell/BiasAdd_1:output:0gru_cell/Const:output:0#gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split|
gru_cell/addAddV2gru_cell/split:output:0gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������`
gru_cell/SigmoidSigmoidgru_cell/add:z:0*
T0*(
_output_shapes
:����������~
gru_cell/add_1AddV2gru_cell/split:output:1gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������d
gru_cell/Sigmoid_1Sigmoidgru_cell/add_1:z:0*
T0*(
_output_shapes
:����������y
gru_cell/mulMulgru_cell/Sigmoid_1:y:0gru_cell/split_1:output:2*
T0*(
_output_shapes
:����������u
gru_cell/add_2AddV2gru_cell/split:output:2gru_cell/mul:z:0*
T0*(
_output_shapes
:����������\
gru_cell/ReluRelugru_cell/add_2:z:0*
T0*(
_output_shapes
:����������n
gru_cell/mul_1Mulgru_cell/Sigmoid:y:0zeros:output:0*
T0*(
_output_shapes
:����������S
gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?u
gru_cell/subSubgru_cell/sub/x:output:0gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:����������w
gru_cell/mul_2Mulgru_cell/sub:z:0gru_cell/Relu:activations:0*
T0*(
_output_shapes
:����������r
gru_cell/add_3AddV2gru_cell/mul_1:z:0gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   ^
TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0%TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���F
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
���������T
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0 gru_cell_readvariableop_resource'gru_cell_matmul_readvariableop_resource)gru_cell_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*:
_output_shapes(
&: : : : :����������: : : : : *%
_read_only_resource_inputs
	*
bodyR
while_body_80760*
condR
while_cond_80759*9
output_shapes(
&: : : : :����������: : : : : *
parallel_iterations �
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elementsh
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:����������[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^gru_cell/MatMul/ReadVariableOp!^gru_cell/MatMul_1/ReadVariableOp^gru_cell/ReadVariableOp^while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������: : : 2@
gru_cell/MatMul/ReadVariableOpgru_cell/MatMul/ReadVariableOp2D
 gru_cell/MatMul_1/ReadVariableOp gru_cell/MatMul_1/ReadVariableOp22
gru_cell/ReadVariableOpgru_cell/ReadVariableOp2
whilewhile:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
%__inference_gru_5_layer_call_fn_80385

inputs
unknown:	�
	unknown_0:	�
	unknown_1:
��
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_gru_5_layer_call_and_return_conditional_losses_80248p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������: : : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name80381:%!

_user_specified_name80379:%!

_user_specified_name80377:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
'__inference_dense_5_layer_call_fn_81014

inputs
unknown:	�
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_80084o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name81010:%!

_user_specified_name81008:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
C__inference_gru_cell_layer_call_and_return_conditional_losses_79781

inputs

states*
readvariableop_resource:	�1
matmul_readvariableop_resource:	�4
 matmul_1_readvariableop_resource:
��
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOpg
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0a
unstackUnpackReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
numu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������i
BiasAddBiasAddMatMul:product:0unstack:output:0*
T0*(
_output_shapes
:����������Z
split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_splitz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0n
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������m
	BiasAdd_1BiasAddMatMul_1:product:0unstack:output:1*
T0*(
_output_shapes
:����������Z
ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����\
split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
split_1SplitVBiasAdd_1:output:0Const:output:0split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_splita
addAddV2split:output:0split_1:output:0*
T0*(
_output_shapes
:����������N
SigmoidSigmoidadd:z:0*
T0*(
_output_shapes
:����������c
add_1AddV2split:output:1split_1:output:1*
T0*(
_output_shapes
:����������R
	Sigmoid_1Sigmoid	add_1:z:0*
T0*(
_output_shapes
:����������^
mulMulSigmoid_1:y:0split_1:output:2*
T0*(
_output_shapes
:����������Z
add_2AddV2split:output:2mul:z:0*
T0*(
_output_shapes
:����������J
ReluRelu	add_2:z:0*
T0*(
_output_shapes
:����������T
mul_1MulSigmoid:y:0states*
T0*(
_output_shapes
:����������J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:����������\
mul_2Mulsub:z:0Relu:activations:0*
T0*(
_output_shapes
:����������W
add_3AddV2	mul_1:z:0	mul_2:z:0*
T0*(
_output_shapes
:����������Y
IdentityIdentity	add_3:z:0^NoOp*
T0*(
_output_shapes
:����������[

Identity_1Identity	add_3:z:0^NoOp*
T0*(
_output_shapes
:����������e
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*
_output_shapes
 "!

identity_1Identity_1:output:0"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-:���������:����������: : : 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:PL
(
_output_shapes
:����������
 
_user_specified_namestates:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�	
�
B__inference_dense_5_layer_call_and_return_conditional_losses_81024

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������S
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�>
�
while_body_80450
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0;
(while_gru_cell_readvariableop_resource_0:	�B
/while_gru_cell_matmul_readvariableop_resource_0:	�E
1while_gru_cell_matmul_1_readvariableop_resource_0:
��
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor9
&while_gru_cell_readvariableop_resource:	�@
-while_gru_cell_matmul_readvariableop_resource:	�C
/while_gru_cell_matmul_1_readvariableop_resource:
����$while/gru_cell/MatMul/ReadVariableOp�&while/gru_cell/MatMul_1/ReadVariableOp�while/gru_cell/ReadVariableOp�
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0�
while/gru_cell/ReadVariableOpReadVariableOp(while_gru_cell_readvariableop_resource_0*
_output_shapes
:	�*
dtype0
while/gru_cell/unstackUnpack%while/gru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
$while/gru_cell/MatMul/ReadVariableOpReadVariableOp/while_gru_cell_matmul_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
while/gru_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0,while/gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAddBiasAddwhile/gru_cell/MatMul:product:0while/gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������i
while/gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/splitSplit'while/gru_cell/split/split_dim:output:0while/gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
&while/gru_cell/MatMul_1/ReadVariableOpReadVariableOp1while_gru_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
��*
dtype0�
while/gru_cell/MatMul_1MatMulwhile_placeholder_2.while/gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAdd_1BiasAdd!while/gru_cell/MatMul_1:product:0while/gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������i
while/gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����k
 while/gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/split_1SplitV!while/gru_cell/BiasAdd_1:output:0while/gru_cell/Const:output:0)while/gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
while/gru_cell/addAddV2while/gru_cell/split:output:0while/gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������l
while/gru_cell/SigmoidSigmoidwhile/gru_cell/add:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_1AddV2while/gru_cell/split:output:1while/gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������p
while/gru_cell/Sigmoid_1Sigmoidwhile/gru_cell/add_1:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mulMulwhile/gru_cell/Sigmoid_1:y:0while/gru_cell/split_1:output:2*
T0*(
_output_shapes
:�����������
while/gru_cell/add_2AddV2while/gru_cell/split:output:2while/gru_cell/mul:z:0*
T0*(
_output_shapes
:����������h
while/gru_cell/ReluReluwhile/gru_cell/add_2:z:0*
T0*(
_output_shapes
:����������
while/gru_cell/mul_1Mulwhile/gru_cell/Sigmoid:y:0while_placeholder_2*
T0*(
_output_shapes
:����������Y
while/gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
while/gru_cell/subSubwhile/gru_cell/sub/x:output:0while/gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mul_2Mulwhile/gru_cell/sub:z:0!while/gru_cell/Relu:activations:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_3AddV2while/gru_cell/mul_1:z:0while/gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������r
0while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_19while/TensorArrayV2Write/TensorListSetItem/index:output:0while/gru_cell/add_3:z:0*
_output_shapes
: *
element_dtype0:���M
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: v
while/Identity_4Identitywhile/gru_cell/add_3:z:0^while/NoOp*
T0*(
_output_shapes
:�����������

while/NoOpNoOp%^while/gru_cell/MatMul/ReadVariableOp'^while/gru_cell/MatMul_1/ReadVariableOp^while/gru_cell/ReadVariableOp*
_output_shapes
 "d
/while_gru_cell_matmul_1_readvariableop_resource1while_gru_cell_matmul_1_readvariableop_resource_0"`
-while_gru_cell_matmul_readvariableop_resource/while_gru_cell_matmul_readvariableop_resource_0"R
&while_gru_cell_readvariableop_resource(while_gru_cell_readvariableop_resource_0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0")
while_identitywhile/Identity:output:0"0
while_strided_slice_1while_strided_slice_1_0"�
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&: : : : :����������: : : : : 2L
$while/gru_cell/MatMul/ReadVariableOp$while/gru_cell/MatMul/ReadVariableOp2P
&while/gru_cell/MatMul_1/ReadVariableOp&while/gru_cell/MatMul_1/ReadVariableOp2>
while/gru_cell/ReadVariableOpwhile/gru_cell/ReadVariableOp:(	$
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:_[

_output_shapes
: 
A
_user_specified_name)'TensorArrayUnstack/TensorListFromTensor:GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�M
�
@__inference_gru_5_layer_call_and_return_conditional_losses_80067

inputs3
 gru_cell_readvariableop_resource:	�:
'gru_cell_matmul_readvariableop_resource:	�=
)gru_cell_matmul_1_readvariableop_resource:
��
identity��gru_cell/MatMul/ReadVariableOp� gru_cell/MatMul_1/ReadVariableOp�gru_cell/ReadVariableOp�whileI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :�s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:����������c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:���������R
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
::��_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
����������
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_masky
gru_cell/ReadVariableOpReadVariableOp gru_cell_readvariableop_resource*
_output_shapes
:	�*
dtype0s
gru_cell/unstackUnpackgru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
gru_cell/MatMul/ReadVariableOpReadVariableOp'gru_cell_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
gru_cell/MatMulMatMulstrided_slice_2:output:0&gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAddBiasAddgru_cell/MatMul:product:0gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������c
gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/splitSplit!gru_cell/split/split_dim:output:0gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
 gru_cell/MatMul_1/ReadVariableOpReadVariableOp)gru_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
gru_cell/MatMul_1MatMulzeros:output:0(gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAdd_1BiasAddgru_cell/MatMul_1:product:0gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������c
gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����e
gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/split_1SplitVgru_cell/BiasAdd_1:output:0gru_cell/Const:output:0#gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split|
gru_cell/addAddV2gru_cell/split:output:0gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������`
gru_cell/SigmoidSigmoidgru_cell/add:z:0*
T0*(
_output_shapes
:����������~
gru_cell/add_1AddV2gru_cell/split:output:1gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������d
gru_cell/Sigmoid_1Sigmoidgru_cell/add_1:z:0*
T0*(
_output_shapes
:����������y
gru_cell/mulMulgru_cell/Sigmoid_1:y:0gru_cell/split_1:output:2*
T0*(
_output_shapes
:����������u
gru_cell/add_2AddV2gru_cell/split:output:2gru_cell/mul:z:0*
T0*(
_output_shapes
:����������\
gru_cell/ReluRelugru_cell/add_2:z:0*
T0*(
_output_shapes
:����������n
gru_cell/mul_1Mulgru_cell/Sigmoid:y:0zeros:output:0*
T0*(
_output_shapes
:����������S
gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?u
gru_cell/subSubgru_cell/sub/x:output:0gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:����������w
gru_cell/mul_2Mulgru_cell/sub:z:0gru_cell/Relu:activations:0*
T0*(
_output_shapes
:����������r
gru_cell/add_3AddV2gru_cell/mul_1:z:0gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   ^
TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0%TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���F
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
���������T
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0 gru_cell_readvariableop_resource'gru_cell_matmul_readvariableop_resource)gru_cell_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*:
_output_shapes(
&: : : : :����������: : : : : *%
_read_only_resource_inputs
	*
bodyR
while_body_79977*
condR
while_cond_79976*9
output_shapes(
&: : : : :����������: : : : : *
parallel_iterations �
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elementsh
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:����������[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^gru_cell/MatMul/ReadVariableOp!^gru_cell/MatMul_1/ReadVariableOp^gru_cell/ReadVariableOp^while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������: : : 2@
gru_cell/MatMul/ReadVariableOpgru_cell/MatMul/ReadVariableOp2D
 gru_cell/MatMul_1/ReadVariableOp gru_cell/MatMul_1/ReadVariableOp22
gru_cell/ReadVariableOpgru_cell/ReadVariableOp2
whilewhile:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
G__inference_sequential_5_layer_call_and_return_conditional_losses_80262
input_6
gru_5_80249:	�
gru_5_80251:	�
gru_5_80253:
�� 
dense_5_80256:	�
dense_5_80258:
identity��dense_5/StatefulPartitionedCall�gru_5/StatefulPartitionedCall�
gru_5/StatefulPartitionedCallStatefulPartitionedCallinput_6gru_5_80249gru_5_80251gru_5_80253*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_gru_5_layer_call_and_return_conditional_losses_80248�
dense_5/StatefulPartitionedCallStatefulPartitionedCall&gru_5/StatefulPartitionedCall:output:0dense_5_80256dense_5_80258*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_80084w
IdentityIdentity(dense_5/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������d
NoOpNoOp ^dense_5/StatefulPartitionedCall^gru_5/StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:���������: : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2>
gru_5/StatefulPartitionedCallgru_5/StatefulPartitionedCall:%!

_user_specified_name80258:%!

_user_specified_name80256:%!

_user_specified_name80253:%!

_user_specified_name80251:%!

_user_specified_name80249:T P
+
_output_shapes
:���������
!
_user_specified_name	input_6
�M
�
@__inference_gru_5_layer_call_and_return_conditional_losses_81005

inputs3
 gru_cell_readvariableop_resource:	�:
'gru_cell_matmul_readvariableop_resource:	�=
)gru_cell_matmul_1_readvariableop_resource:
��
identity��gru_cell/MatMul/ReadVariableOp� gru_cell/MatMul_1/ReadVariableOp�gru_cell/ReadVariableOp�whileI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :�s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:����������c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:���������R
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
::��_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
����������
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_masky
gru_cell/ReadVariableOpReadVariableOp gru_cell_readvariableop_resource*
_output_shapes
:	�*
dtype0s
gru_cell/unstackUnpackgru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
gru_cell/MatMul/ReadVariableOpReadVariableOp'gru_cell_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
gru_cell/MatMulMatMulstrided_slice_2:output:0&gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAddBiasAddgru_cell/MatMul:product:0gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������c
gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/splitSplit!gru_cell/split/split_dim:output:0gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
 gru_cell/MatMul_1/ReadVariableOpReadVariableOp)gru_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
gru_cell/MatMul_1MatMulzeros:output:0(gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAdd_1BiasAddgru_cell/MatMul_1:product:0gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������c
gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����e
gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/split_1SplitVgru_cell/BiasAdd_1:output:0gru_cell/Const:output:0#gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split|
gru_cell/addAddV2gru_cell/split:output:0gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������`
gru_cell/SigmoidSigmoidgru_cell/add:z:0*
T0*(
_output_shapes
:����������~
gru_cell/add_1AddV2gru_cell/split:output:1gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������d
gru_cell/Sigmoid_1Sigmoidgru_cell/add_1:z:0*
T0*(
_output_shapes
:����������y
gru_cell/mulMulgru_cell/Sigmoid_1:y:0gru_cell/split_1:output:2*
T0*(
_output_shapes
:����������u
gru_cell/add_2AddV2gru_cell/split:output:2gru_cell/mul:z:0*
T0*(
_output_shapes
:����������\
gru_cell/ReluRelugru_cell/add_2:z:0*
T0*(
_output_shapes
:����������n
gru_cell/mul_1Mulgru_cell/Sigmoid:y:0zeros:output:0*
T0*(
_output_shapes
:����������S
gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?u
gru_cell/subSubgru_cell/sub/x:output:0gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:����������w
gru_cell/mul_2Mulgru_cell/sub:z:0gru_cell/Relu:activations:0*
T0*(
_output_shapes
:����������r
gru_cell/add_3AddV2gru_cell/mul_1:z:0gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   ^
TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0%TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���F
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
���������T
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0 gru_cell_readvariableop_resource'gru_cell_matmul_readvariableop_resource)gru_cell_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*:
_output_shapes(
&: : : : :����������: : : : : *%
_read_only_resource_inputs
	*
bodyR
while_body_80915*
condR
while_cond_80914*9
output_shapes(
&: : : : :����������: : : : : *
parallel_iterations �
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elementsh
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:����������[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^gru_cell/MatMul/ReadVariableOp!^gru_cell/MatMul_1/ReadVariableOp^gru_cell/ReadVariableOp^while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������: : : 2@
gru_cell/MatMul/ReadVariableOpgru_cell/MatMul/ReadVariableOp2D
 gru_cell/MatMul_1/ReadVariableOp gru_cell/MatMul_1/ReadVariableOp22
gru_cell/ReadVariableOpgru_cell/ReadVariableOp2
whilewhile:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
while_cond_80157
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_80157___redundant_placeholder03
/while_while_cond_80157___redundant_placeholder13
/while_while_cond_80157___redundant_placeholder23
/while_while_cond_80157___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*A
_input_shapes0
.: : : : :����������: :::::

_output_shapes
::GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�	
�
,__inference_sequential_5_layer_call_fn_80292
input_6
unknown:	�
	unknown_0:	�
	unknown_1:
��
	unknown_2:	�
	unknown_3:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_6unknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_sequential_5_layer_call_and_return_conditional_losses_80262o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:���������: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name80288:%!

_user_specified_name80286:%!

_user_specified_name80284:%!

_user_specified_name80282:%!

_user_specified_name80280:T P
+
_output_shapes
:���������
!
_user_specified_name	input_6
�5
�
@__inference_gru_5_layer_call_and_return_conditional_losses_79860

inputs!
gru_cell_79782:	�!
gru_cell_79784:	�"
gru_cell_79786:
��
identity�� gru_cell/StatefulPartitionedCall�whileI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :�s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:����������c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          v
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :������������������R
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
::��_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
����������
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
 gru_cell/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0gru_cell_79782gru_cell_79784gru_cell_79786*
Tin	
2*
Tout
2*
_collective_manager_ids
 *<
_output_shapes*
(:����������:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_gru_cell_layer_call_and_return_conditional_losses_79781n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   ^
TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0%TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���F
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
���������T
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0gru_cell_79782gru_cell_79784gru_cell_79786*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*:
_output_shapes(
&: : : : :����������: : : : : *%
_read_only_resource_inputs
	*
bodyR
while_body_79795*
condR
while_cond_79794*9
output_shapes(
&: : : : :����������: : : : : *
parallel_iterations �
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elementsh
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:����������[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:����������M
NoOpNoOp!^gru_cell/StatefulPartitionedCall^while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:������������������: : : 2D
 gru_cell/StatefulPartitionedCall gru_cell/StatefulPartitionedCall2
whilewhile:%!

_user_specified_name79786:%!

_user_specified_name79784:%!

_user_specified_name79782:\ X
4
_output_shapes"
 :������������������
 
_user_specified_nameinputs
�
�
while_cond_79976
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_79976___redundant_placeholder03
/while_while_cond_79976___redundant_placeholder13
/while_while_cond_79976___redundant_placeholder23
/while_while_cond_79976___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*A
_input_shapes0
.: : : : :����������: :::::

_output_shapes
::GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�
�
while_cond_80604
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_80604___redundant_placeholder03
/while_while_cond_80604___redundant_placeholder13
/while_while_cond_80604___redundant_placeholder23
/while_while_cond_80604___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*A
_input_shapes0
.: : : : :����������: :::::

_output_shapes
::GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�M
�
@__inference_gru_5_layer_call_and_return_conditional_losses_80248

inputs3
 gru_cell_readvariableop_resource:	�:
'gru_cell_matmul_readvariableop_resource:	�=
)gru_cell_matmul_1_readvariableop_resource:
��
identity��gru_cell/MatMul/ReadVariableOp� gru_cell/MatMul_1/ReadVariableOp�gru_cell/ReadVariableOp�whileI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :�s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:����������c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          m
	transpose	Transposeinputstranspose/perm:output:0*
T0*+
_output_shapes
:���������R
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
::��_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
����������
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_masky
gru_cell/ReadVariableOpReadVariableOp gru_cell_readvariableop_resource*
_output_shapes
:	�*
dtype0s
gru_cell/unstackUnpackgru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
gru_cell/MatMul/ReadVariableOpReadVariableOp'gru_cell_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
gru_cell/MatMulMatMulstrided_slice_2:output:0&gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAddBiasAddgru_cell/MatMul:product:0gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������c
gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/splitSplit!gru_cell/split/split_dim:output:0gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
 gru_cell/MatMul_1/ReadVariableOpReadVariableOp)gru_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
gru_cell/MatMul_1MatMulzeros:output:0(gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAdd_1BiasAddgru_cell/MatMul_1:product:0gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������c
gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����e
gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/split_1SplitVgru_cell/BiasAdd_1:output:0gru_cell/Const:output:0#gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split|
gru_cell/addAddV2gru_cell/split:output:0gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������`
gru_cell/SigmoidSigmoidgru_cell/add:z:0*
T0*(
_output_shapes
:����������~
gru_cell/add_1AddV2gru_cell/split:output:1gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������d
gru_cell/Sigmoid_1Sigmoidgru_cell/add_1:z:0*
T0*(
_output_shapes
:����������y
gru_cell/mulMulgru_cell/Sigmoid_1:y:0gru_cell/split_1:output:2*
T0*(
_output_shapes
:����������u
gru_cell/add_2AddV2gru_cell/split:output:2gru_cell/mul:z:0*
T0*(
_output_shapes
:����������\
gru_cell/ReluRelugru_cell/add_2:z:0*
T0*(
_output_shapes
:����������n
gru_cell/mul_1Mulgru_cell/Sigmoid:y:0zeros:output:0*
T0*(
_output_shapes
:����������S
gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?u
gru_cell/subSubgru_cell/sub/x:output:0gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:����������w
gru_cell/mul_2Mulgru_cell/sub:z:0gru_cell/Relu:activations:0*
T0*(
_output_shapes
:����������r
gru_cell/add_3AddV2gru_cell/mul_1:z:0gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   ^
TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0%TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���F
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
���������T
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0 gru_cell_readvariableop_resource'gru_cell_matmul_readvariableop_resource)gru_cell_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*:
_output_shapes(
&: : : : :����������: : : : : *%
_read_only_resource_inputs
	*
bodyR
while_body_80158*
condR
while_cond_80157*9
output_shapes(
&: : : : :����������: : : : : *
parallel_iterations �
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elementsh
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:����������[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^gru_cell/MatMul/ReadVariableOp!^gru_cell/MatMul_1/ReadVariableOp^gru_cell/ReadVariableOp^while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*0
_input_shapes
:���������: : : 2@
gru_cell/MatMul/ReadVariableOpgru_cell/MatMul/ReadVariableOp2D
 gru_cell/MatMul_1/ReadVariableOp gru_cell/MatMul_1/ReadVariableOp22
gru_cell/ReadVariableOpgru_cell/ReadVariableOp2
whilewhile:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:S O
+
_output_shapes
:���������
 
_user_specified_nameinputs
�>
�
while_body_80760
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0;
(while_gru_cell_readvariableop_resource_0:	�B
/while_gru_cell_matmul_readvariableop_resource_0:	�E
1while_gru_cell_matmul_1_readvariableop_resource_0:
��
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor9
&while_gru_cell_readvariableop_resource:	�@
-while_gru_cell_matmul_readvariableop_resource:	�C
/while_gru_cell_matmul_1_readvariableop_resource:
����$while/gru_cell/MatMul/ReadVariableOp�&while/gru_cell/MatMul_1/ReadVariableOp�while/gru_cell/ReadVariableOp�
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0�
while/gru_cell/ReadVariableOpReadVariableOp(while_gru_cell_readvariableop_resource_0*
_output_shapes
:	�*
dtype0
while/gru_cell/unstackUnpack%while/gru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
$while/gru_cell/MatMul/ReadVariableOpReadVariableOp/while_gru_cell_matmul_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
while/gru_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0,while/gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAddBiasAddwhile/gru_cell/MatMul:product:0while/gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������i
while/gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/splitSplit'while/gru_cell/split/split_dim:output:0while/gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
&while/gru_cell/MatMul_1/ReadVariableOpReadVariableOp1while_gru_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
��*
dtype0�
while/gru_cell/MatMul_1MatMulwhile_placeholder_2.while/gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAdd_1BiasAdd!while/gru_cell/MatMul_1:product:0while/gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������i
while/gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����k
 while/gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/split_1SplitV!while/gru_cell/BiasAdd_1:output:0while/gru_cell/Const:output:0)while/gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
while/gru_cell/addAddV2while/gru_cell/split:output:0while/gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������l
while/gru_cell/SigmoidSigmoidwhile/gru_cell/add:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_1AddV2while/gru_cell/split:output:1while/gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������p
while/gru_cell/Sigmoid_1Sigmoidwhile/gru_cell/add_1:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mulMulwhile/gru_cell/Sigmoid_1:y:0while/gru_cell/split_1:output:2*
T0*(
_output_shapes
:�����������
while/gru_cell/add_2AddV2while/gru_cell/split:output:2while/gru_cell/mul:z:0*
T0*(
_output_shapes
:����������h
while/gru_cell/ReluReluwhile/gru_cell/add_2:z:0*
T0*(
_output_shapes
:����������
while/gru_cell/mul_1Mulwhile/gru_cell/Sigmoid:y:0while_placeholder_2*
T0*(
_output_shapes
:����������Y
while/gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
while/gru_cell/subSubwhile/gru_cell/sub/x:output:0while/gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mul_2Mulwhile/gru_cell/sub:z:0!while/gru_cell/Relu:activations:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_3AddV2while/gru_cell/mul_1:z:0while/gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������r
0while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_19while/TensorArrayV2Write/TensorListSetItem/index:output:0while/gru_cell/add_3:z:0*
_output_shapes
: *
element_dtype0:���M
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: v
while/Identity_4Identitywhile/gru_cell/add_3:z:0^while/NoOp*
T0*(
_output_shapes
:�����������

while/NoOpNoOp%^while/gru_cell/MatMul/ReadVariableOp'^while/gru_cell/MatMul_1/ReadVariableOp^while/gru_cell/ReadVariableOp*
_output_shapes
 "d
/while_gru_cell_matmul_1_readvariableop_resource1while_gru_cell_matmul_1_readvariableop_resource_0"`
-while_gru_cell_matmul_readvariableop_resource/while_gru_cell_matmul_readvariableop_resource_0"R
&while_gru_cell_readvariableop_resource(while_gru_cell_readvariableop_resource_0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0")
while_identitywhile/Identity:output:0"0
while_strided_slice_1while_strided_slice_1_0"�
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&: : : : :����������: : : : : 2L
$while/gru_cell/MatMul/ReadVariableOp$while/gru_cell/MatMul/ReadVariableOp2P
&while/gru_cell/MatMul_1/ReadVariableOp&while/gru_cell/MatMul_1/ReadVariableOp2>
while/gru_cell/ReadVariableOpwhile/gru_cell/ReadVariableOp:(	$
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:_[

_output_shapes
: 
A
_user_specified_name)'TensorArrayUnstack/TensorListFromTensor:GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�
�
%__inference_gru_5_layer_call_fn_80363
inputs_0
unknown:	�
	unknown_0:	�
	unknown_1:
��
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_gru_5_layer_call_and_return_conditional_losses_79860p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:������������������: : : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name80359:%!

_user_specified_name80357:%!

_user_specified_name80355:^ Z
4
_output_shapes"
 :������������������
"
_user_specified_name
inputs_0
�>
�
while_body_79977
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0;
(while_gru_cell_readvariableop_resource_0:	�B
/while_gru_cell_matmul_readvariableop_resource_0:	�E
1while_gru_cell_matmul_1_readvariableop_resource_0:
��
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor9
&while_gru_cell_readvariableop_resource:	�@
-while_gru_cell_matmul_readvariableop_resource:	�C
/while_gru_cell_matmul_1_readvariableop_resource:
����$while/gru_cell/MatMul/ReadVariableOp�&while/gru_cell/MatMul_1/ReadVariableOp�while/gru_cell/ReadVariableOp�
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0�
while/gru_cell/ReadVariableOpReadVariableOp(while_gru_cell_readvariableop_resource_0*
_output_shapes
:	�*
dtype0
while/gru_cell/unstackUnpack%while/gru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
$while/gru_cell/MatMul/ReadVariableOpReadVariableOp/while_gru_cell_matmul_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
while/gru_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0,while/gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAddBiasAddwhile/gru_cell/MatMul:product:0while/gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������i
while/gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/splitSplit'while/gru_cell/split/split_dim:output:0while/gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
&while/gru_cell/MatMul_1/ReadVariableOpReadVariableOp1while_gru_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
��*
dtype0�
while/gru_cell/MatMul_1MatMulwhile_placeholder_2.while/gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAdd_1BiasAdd!while/gru_cell/MatMul_1:product:0while/gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������i
while/gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����k
 while/gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/split_1SplitV!while/gru_cell/BiasAdd_1:output:0while/gru_cell/Const:output:0)while/gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
while/gru_cell/addAddV2while/gru_cell/split:output:0while/gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������l
while/gru_cell/SigmoidSigmoidwhile/gru_cell/add:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_1AddV2while/gru_cell/split:output:1while/gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������p
while/gru_cell/Sigmoid_1Sigmoidwhile/gru_cell/add_1:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mulMulwhile/gru_cell/Sigmoid_1:y:0while/gru_cell/split_1:output:2*
T0*(
_output_shapes
:�����������
while/gru_cell/add_2AddV2while/gru_cell/split:output:2while/gru_cell/mul:z:0*
T0*(
_output_shapes
:����������h
while/gru_cell/ReluReluwhile/gru_cell/add_2:z:0*
T0*(
_output_shapes
:����������
while/gru_cell/mul_1Mulwhile/gru_cell/Sigmoid:y:0while_placeholder_2*
T0*(
_output_shapes
:����������Y
while/gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
while/gru_cell/subSubwhile/gru_cell/sub/x:output:0while/gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mul_2Mulwhile/gru_cell/sub:z:0!while/gru_cell/Relu:activations:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_3AddV2while/gru_cell/mul_1:z:0while/gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������r
0while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_19while/TensorArrayV2Write/TensorListSetItem/index:output:0while/gru_cell/add_3:z:0*
_output_shapes
: *
element_dtype0:���M
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: v
while/Identity_4Identitywhile/gru_cell/add_3:z:0^while/NoOp*
T0*(
_output_shapes
:�����������

while/NoOpNoOp%^while/gru_cell/MatMul/ReadVariableOp'^while/gru_cell/MatMul_1/ReadVariableOp^while/gru_cell/ReadVariableOp*
_output_shapes
 "d
/while_gru_cell_matmul_1_readvariableop_resource1while_gru_cell_matmul_1_readvariableop_resource_0"`
-while_gru_cell_matmul_readvariableop_resource/while_gru_cell_matmul_readvariableop_resource_0"R
&while_gru_cell_readvariableop_resource(while_gru_cell_readvariableop_resource_0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0")
while_identitywhile/Identity:output:0"0
while_strided_slice_1while_strided_slice_1_0"�
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&: : : : :����������: : : : : 2L
$while/gru_cell/MatMul/ReadVariableOp$while/gru_cell/MatMul/ReadVariableOp2P
&while/gru_cell/MatMul_1/ReadVariableOp&while/gru_cell/MatMul_1/ReadVariableOp2>
while/gru_cell/ReadVariableOpwhile/gru_cell/ReadVariableOp:(	$
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:_[

_output_shapes
: 
A
_user_specified_name)'TensorArrayUnstack/TensorListFromTensor:GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�
�
C__inference_gru_cell_layer_call_and_return_conditional_losses_81091

inputs
states_0*
readvariableop_resource:	�1
matmul_readvariableop_resource:	�4
 matmul_1_readvariableop_resource:
��
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOpg
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0a
unstackUnpackReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
numu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������i
BiasAddBiasAddMatMul:product:0unstack:output:0*
T0*(
_output_shapes
:����������Z
split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_splitz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0p
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������m
	BiasAdd_1BiasAddMatMul_1:product:0unstack:output:1*
T0*(
_output_shapes
:����������Z
ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����\
split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
split_1SplitVBiasAdd_1:output:0Const:output:0split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_splita
addAddV2split:output:0split_1:output:0*
T0*(
_output_shapes
:����������N
SigmoidSigmoidadd:z:0*
T0*(
_output_shapes
:����������c
add_1AddV2split:output:1split_1:output:1*
T0*(
_output_shapes
:����������R
	Sigmoid_1Sigmoid	add_1:z:0*
T0*(
_output_shapes
:����������^
mulMulSigmoid_1:y:0split_1:output:2*
T0*(
_output_shapes
:����������Z
add_2AddV2split:output:2mul:z:0*
T0*(
_output_shapes
:����������J
ReluRelu	add_2:z:0*
T0*(
_output_shapes
:����������V
mul_1MulSigmoid:y:0states_0*
T0*(
_output_shapes
:����������J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:����������\
mul_2Mulsub:z:0Relu:activations:0*
T0*(
_output_shapes
:����������W
add_3AddV2	mul_1:z:0	mul_2:z:0*
T0*(
_output_shapes
:����������Y
IdentityIdentity	add_3:z:0^NoOp*
T0*(
_output_shapes
:����������[

Identity_1Identity	add_3:z:0^NoOp*
T0*(
_output_shapes
:����������e
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*
_output_shapes
 "!

identity_1Identity_1:output:0"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-:���������:����������: : : 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:RN
(
_output_shapes
:����������
"
_user_specified_name
states_0:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
(__inference_gru_cell_layer_call_fn_81038

inputs
states_0
unknown:	�
	unknown_0:	�
	unknown_1:
��
identity

identity_1��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *<
_output_shapes*
(:����������:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_gru_cell_layer_call_and_return_conditional_losses_79637p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������r

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:����������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "!

identity_1Identity_1:output:0"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-:���������:����������: : : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name81032:%!

_user_specified_name81030:%!

_user_specified_name81028:RN
(
_output_shapes
:����������
"
_user_specified_name
states_0:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
while_cond_80759
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_80759___redundant_placeholder03
/while_while_cond_80759___redundant_placeholder13
/while_while_cond_80759___redundant_placeholder23
/while_while_cond_80759___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*A
_input_shapes0
.: : : : :����������: :::::

_output_shapes
::GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�
�
C__inference_gru_cell_layer_call_and_return_conditional_losses_79637

inputs

states*
readvariableop_resource:	�1
matmul_readvariableop_resource:	�4
 matmul_1_readvariableop_resource:
��
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOpg
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0a
unstackUnpackReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
numu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������i
BiasAddBiasAddMatMul:product:0unstack:output:0*
T0*(
_output_shapes
:����������Z
split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_splitz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0n
MatMul_1MatMulstatesMatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������m
	BiasAdd_1BiasAddMatMul_1:product:0unstack:output:1*
T0*(
_output_shapes
:����������Z
ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����\
split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
split_1SplitVBiasAdd_1:output:0Const:output:0split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_splita
addAddV2split:output:0split_1:output:0*
T0*(
_output_shapes
:����������N
SigmoidSigmoidadd:z:0*
T0*(
_output_shapes
:����������c
add_1AddV2split:output:1split_1:output:1*
T0*(
_output_shapes
:����������R
	Sigmoid_1Sigmoid	add_1:z:0*
T0*(
_output_shapes
:����������^
mulMulSigmoid_1:y:0split_1:output:2*
T0*(
_output_shapes
:����������Z
add_2AddV2split:output:2mul:z:0*
T0*(
_output_shapes
:����������J
ReluRelu	add_2:z:0*
T0*(
_output_shapes
:����������T
mul_1MulSigmoid:y:0states*
T0*(
_output_shapes
:����������J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:����������\
mul_2Mulsub:z:0Relu:activations:0*
T0*(
_output_shapes
:����������W
add_3AddV2	mul_1:z:0	mul_2:z:0*
T0*(
_output_shapes
:����������Y
IdentityIdentity	add_3:z:0^NoOp*
T0*(
_output_shapes
:����������[

Identity_1Identity	add_3:z:0^NoOp*
T0*(
_output_shapes
:����������e
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*
_output_shapes
 "!

identity_1Identity_1:output:0"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-:���������:����������: : : 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:PL
(
_output_shapes
:����������
 
_user_specified_namestates:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
while_cond_80449
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_80449___redundant_placeholder03
/while_while_cond_80449___redundant_placeholder13
/while_while_cond_80449___redundant_placeholder23
/while_while_cond_80449___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*A
_input_shapes0
.: : : : :����������: :::::

_output_shapes
::GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�
�
while_cond_79650
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_79650___redundant_placeholder03
/while_while_cond_79650___redundant_placeholder13
/while_while_cond_79650___redundant_placeholder23
/while_while_cond_79650___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*A
_input_shapes0
.: : : : :����������: :::::

_output_shapes
::GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�M
�
@__inference_gru_5_layer_call_and_return_conditional_losses_80695
inputs_03
 gru_cell_readvariableop_resource:	�:
'gru_cell_matmul_readvariableop_resource:	�=
)gru_cell_matmul_1_readvariableop_resource:
��
identity��gru_cell/MatMul/ReadVariableOp� gru_cell/MatMul_1/ReadVariableOp�gru_cell/ReadVariableOp�whileK
ShapeShapeinputs_0*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :�s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:����������c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          x
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :������������������R
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
::��_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
����������
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_masky
gru_cell/ReadVariableOpReadVariableOp gru_cell_readvariableop_resource*
_output_shapes
:	�*
dtype0s
gru_cell/unstackUnpackgru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
gru_cell/MatMul/ReadVariableOpReadVariableOp'gru_cell_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
gru_cell/MatMulMatMulstrided_slice_2:output:0&gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAddBiasAddgru_cell/MatMul:product:0gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������c
gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/splitSplit!gru_cell/split/split_dim:output:0gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
 gru_cell/MatMul_1/ReadVariableOpReadVariableOp)gru_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
gru_cell/MatMul_1MatMulzeros:output:0(gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAdd_1BiasAddgru_cell/MatMul_1:product:0gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������c
gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����e
gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/split_1SplitVgru_cell/BiasAdd_1:output:0gru_cell/Const:output:0#gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split|
gru_cell/addAddV2gru_cell/split:output:0gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������`
gru_cell/SigmoidSigmoidgru_cell/add:z:0*
T0*(
_output_shapes
:����������~
gru_cell/add_1AddV2gru_cell/split:output:1gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������d
gru_cell/Sigmoid_1Sigmoidgru_cell/add_1:z:0*
T0*(
_output_shapes
:����������y
gru_cell/mulMulgru_cell/Sigmoid_1:y:0gru_cell/split_1:output:2*
T0*(
_output_shapes
:����������u
gru_cell/add_2AddV2gru_cell/split:output:2gru_cell/mul:z:0*
T0*(
_output_shapes
:����������\
gru_cell/ReluRelugru_cell/add_2:z:0*
T0*(
_output_shapes
:����������n
gru_cell/mul_1Mulgru_cell/Sigmoid:y:0zeros:output:0*
T0*(
_output_shapes
:����������S
gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?u
gru_cell/subSubgru_cell/sub/x:output:0gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:����������w
gru_cell/mul_2Mulgru_cell/sub:z:0gru_cell/Relu:activations:0*
T0*(
_output_shapes
:����������r
gru_cell/add_3AddV2gru_cell/mul_1:z:0gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   ^
TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0%TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���F
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
���������T
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0 gru_cell_readvariableop_resource'gru_cell_matmul_readvariableop_resource)gru_cell_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*:
_output_shapes(
&: : : : :����������: : : : : *%
_read_only_resource_inputs
	*
bodyR
while_body_80605*
condR
while_cond_80604*9
output_shapes(
&: : : : :����������: : : : : *
parallel_iterations �
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elementsh
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:����������[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^gru_cell/MatMul/ReadVariableOp!^gru_cell/MatMul_1/ReadVariableOp^gru_cell/ReadVariableOp^while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:������������������: : : 2@
gru_cell/MatMul/ReadVariableOpgru_cell/MatMul/ReadVariableOp2D
 gru_cell/MatMul_1/ReadVariableOp gru_cell/MatMul_1/ReadVariableOp22
gru_cell/ReadVariableOpgru_cell/ReadVariableOp2
whilewhile:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:^ Z
4
_output_shapes"
 :������������������
"
_user_specified_name
inputs_0
�o
�
 __inference__wrapped_model_79572
input_6F
3sequential_5_gru_5_gru_cell_readvariableop_resource:	�M
:sequential_5_gru_5_gru_cell_matmul_readvariableop_resource:	�P
<sequential_5_gru_5_gru_cell_matmul_1_readvariableop_resource:
��F
3sequential_5_dense_5_matmul_readvariableop_resource:	�B
4sequential_5_dense_5_biasadd_readvariableop_resource:
identity��+sequential_5/dense_5/BiasAdd/ReadVariableOp�*sequential_5/dense_5/MatMul/ReadVariableOp�1sequential_5/gru_5/gru_cell/MatMul/ReadVariableOp�3sequential_5/gru_5/gru_cell/MatMul_1/ReadVariableOp�*sequential_5/gru_5/gru_cell/ReadVariableOp�sequential_5/gru_5/while]
sequential_5/gru_5/ShapeShapeinput_6*
T0*
_output_shapes
::��p
&sequential_5/gru_5/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: r
(sequential_5/gru_5/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:r
(sequential_5/gru_5/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
 sequential_5/gru_5/strided_sliceStridedSlice!sequential_5/gru_5/Shape:output:0/sequential_5/gru_5/strided_slice/stack:output:01sequential_5/gru_5/strided_slice/stack_1:output:01sequential_5/gru_5/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskd
!sequential_5/gru_5/zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :��
sequential_5/gru_5/zeros/packedPack)sequential_5/gru_5/strided_slice:output:0*sequential_5/gru_5/zeros/packed/1:output:0*
N*
T0*
_output_shapes
:c
sequential_5/gru_5/zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    �
sequential_5/gru_5/zerosFill(sequential_5/gru_5/zeros/packed:output:0'sequential_5/gru_5/zeros/Const:output:0*
T0*(
_output_shapes
:����������v
!sequential_5/gru_5/transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
sequential_5/gru_5/transpose	Transposeinput_6*sequential_5/gru_5/transpose/perm:output:0*
T0*+
_output_shapes
:���������x
sequential_5/gru_5/Shape_1Shape sequential_5/gru_5/transpose:y:0*
T0*
_output_shapes
::��r
(sequential_5/gru_5/strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*sequential_5/gru_5/strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*sequential_5/gru_5/strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
"sequential_5/gru_5/strided_slice_1StridedSlice#sequential_5/gru_5/Shape_1:output:01sequential_5/gru_5/strided_slice_1/stack:output:03sequential_5/gru_5/strided_slice_1/stack_1:output:03sequential_5/gru_5/strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_masky
.sequential_5/gru_5/TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
����������
 sequential_5/gru_5/TensorArrayV2TensorListReserve7sequential_5/gru_5/TensorArrayV2/element_shape:output:0+sequential_5/gru_5/strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
Hsequential_5/gru_5/TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
:sequential_5/gru_5/TensorArrayUnstack/TensorListFromTensorTensorListFromTensor sequential_5/gru_5/transpose:y:0Qsequential_5/gru_5/TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���r
(sequential_5/gru_5/strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: t
*sequential_5/gru_5/strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:t
*sequential_5/gru_5/strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
"sequential_5/gru_5/strided_slice_2StridedSlice sequential_5/gru_5/transpose:y:01sequential_5/gru_5/strided_slice_2/stack:output:03sequential_5/gru_5/strided_slice_2/stack_1:output:03sequential_5/gru_5/strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
*sequential_5/gru_5/gru_cell/ReadVariableOpReadVariableOp3sequential_5_gru_5_gru_cell_readvariableop_resource*
_output_shapes
:	�*
dtype0�
#sequential_5/gru_5/gru_cell/unstackUnpack2sequential_5/gru_5/gru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
1sequential_5/gru_5/gru_cell/MatMul/ReadVariableOpReadVariableOp:sequential_5_gru_5_gru_cell_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
"sequential_5/gru_5/gru_cell/MatMulMatMul+sequential_5/gru_5/strided_slice_2:output:09sequential_5/gru_5/gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
#sequential_5/gru_5/gru_cell/BiasAddBiasAdd,sequential_5/gru_5/gru_cell/MatMul:product:0,sequential_5/gru_5/gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������v
+sequential_5/gru_5/gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
!sequential_5/gru_5/gru_cell/splitSplit4sequential_5/gru_5/gru_cell/split/split_dim:output:0,sequential_5/gru_5/gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
3sequential_5/gru_5/gru_cell/MatMul_1/ReadVariableOpReadVariableOp<sequential_5_gru_5_gru_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
$sequential_5/gru_5/gru_cell/MatMul_1MatMul!sequential_5/gru_5/zeros:output:0;sequential_5/gru_5/gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
%sequential_5/gru_5/gru_cell/BiasAdd_1BiasAdd.sequential_5/gru_5/gru_cell/MatMul_1:product:0,sequential_5/gru_5/gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������v
!sequential_5/gru_5/gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����x
-sequential_5/gru_5/gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
#sequential_5/gru_5/gru_cell/split_1SplitV.sequential_5/gru_5/gru_cell/BiasAdd_1:output:0*sequential_5/gru_5/gru_cell/Const:output:06sequential_5/gru_5/gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
sequential_5/gru_5/gru_cell/addAddV2*sequential_5/gru_5/gru_cell/split:output:0,sequential_5/gru_5/gru_cell/split_1:output:0*
T0*(
_output_shapes
:�����������
#sequential_5/gru_5/gru_cell/SigmoidSigmoid#sequential_5/gru_5/gru_cell/add:z:0*
T0*(
_output_shapes
:�����������
!sequential_5/gru_5/gru_cell/add_1AddV2*sequential_5/gru_5/gru_cell/split:output:1,sequential_5/gru_5/gru_cell/split_1:output:1*
T0*(
_output_shapes
:�����������
%sequential_5/gru_5/gru_cell/Sigmoid_1Sigmoid%sequential_5/gru_5/gru_cell/add_1:z:0*
T0*(
_output_shapes
:�����������
sequential_5/gru_5/gru_cell/mulMul)sequential_5/gru_5/gru_cell/Sigmoid_1:y:0,sequential_5/gru_5/gru_cell/split_1:output:2*
T0*(
_output_shapes
:�����������
!sequential_5/gru_5/gru_cell/add_2AddV2*sequential_5/gru_5/gru_cell/split:output:2#sequential_5/gru_5/gru_cell/mul:z:0*
T0*(
_output_shapes
:�����������
 sequential_5/gru_5/gru_cell/ReluRelu%sequential_5/gru_5/gru_cell/add_2:z:0*
T0*(
_output_shapes
:�����������
!sequential_5/gru_5/gru_cell/mul_1Mul'sequential_5/gru_5/gru_cell/Sigmoid:y:0!sequential_5/gru_5/zeros:output:0*
T0*(
_output_shapes
:����������f
!sequential_5/gru_5/gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
sequential_5/gru_5/gru_cell/subSub*sequential_5/gru_5/gru_cell/sub/x:output:0'sequential_5/gru_5/gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
!sequential_5/gru_5/gru_cell/mul_2Mul#sequential_5/gru_5/gru_cell/sub:z:0.sequential_5/gru_5/gru_cell/Relu:activations:0*
T0*(
_output_shapes
:�����������
!sequential_5/gru_5/gru_cell/add_3AddV2%sequential_5/gru_5/gru_cell/mul_1:z:0%sequential_5/gru_5/gru_cell/mul_2:z:0*
T0*(
_output_shapes
:�����������
0sequential_5/gru_5/TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   q
/sequential_5/gru_5/TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
"sequential_5/gru_5/TensorArrayV2_1TensorListReserve9sequential_5/gru_5/TensorArrayV2_1/element_shape:output:08sequential_5/gru_5/TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���Y
sequential_5/gru_5/timeConst*
_output_shapes
: *
dtype0*
value	B : v
+sequential_5/gru_5/while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
���������g
%sequential_5/gru_5/while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
sequential_5/gru_5/whileWhile.sequential_5/gru_5/while/loop_counter:output:04sequential_5/gru_5/while/maximum_iterations:output:0 sequential_5/gru_5/time:output:0+sequential_5/gru_5/TensorArrayV2_1:handle:0!sequential_5/gru_5/zeros:output:0+sequential_5/gru_5/strided_slice_1:output:0Jsequential_5/gru_5/TensorArrayUnstack/TensorListFromTensor:output_handle:03sequential_5_gru_5_gru_cell_readvariableop_resource:sequential_5_gru_5_gru_cell_matmul_readvariableop_resource<sequential_5_gru_5_gru_cell_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*:
_output_shapes(
&: : : : :����������: : : : : *%
_read_only_resource_inputs
	*/
body'R%
#sequential_5_gru_5_while_body_79476*/
cond'R%
#sequential_5_gru_5_while_cond_79475*9
output_shapes(
&: : : : :����������: : : : : *
parallel_iterations �
Csequential_5/gru_5/TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
5sequential_5/gru_5/TensorArrayV2Stack/TensorListStackTensorListStack!sequential_5/gru_5/while:output:3Lsequential_5/gru_5/TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elements{
(sequential_5/gru_5/strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������t
*sequential_5/gru_5/strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: t
*sequential_5/gru_5/strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
"sequential_5/gru_5/strided_slice_3StridedSlice>sequential_5/gru_5/TensorArrayV2Stack/TensorListStack:tensor:01sequential_5/gru_5/strided_slice_3/stack:output:03sequential_5/gru_5/strided_slice_3/stack_1:output:03sequential_5/gru_5/strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_maskx
#sequential_5/gru_5/transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
sequential_5/gru_5/transpose_1	Transpose>sequential_5/gru_5/TensorArrayV2Stack/TensorListStack:tensor:0,sequential_5/gru_5/transpose_1/perm:output:0*
T0*,
_output_shapes
:����������n
sequential_5/gru_5/runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    �
*sequential_5/dense_5/MatMul/ReadVariableOpReadVariableOp3sequential_5_dense_5_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
sequential_5/dense_5/MatMulMatMul+sequential_5/gru_5/strided_slice_3:output:02sequential_5/dense_5/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:����������
+sequential_5/dense_5/BiasAdd/ReadVariableOpReadVariableOp4sequential_5_dense_5_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0�
sequential_5/dense_5/BiasAddBiasAdd%sequential_5/dense_5/MatMul:product:03sequential_5/dense_5/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������t
IdentityIdentity%sequential_5/dense_5/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:����������
NoOpNoOp,^sequential_5/dense_5/BiasAdd/ReadVariableOp+^sequential_5/dense_5/MatMul/ReadVariableOp2^sequential_5/gru_5/gru_cell/MatMul/ReadVariableOp4^sequential_5/gru_5/gru_cell/MatMul_1/ReadVariableOp+^sequential_5/gru_5/gru_cell/ReadVariableOp^sequential_5/gru_5/while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:���������: : : : : 2Z
+sequential_5/dense_5/BiasAdd/ReadVariableOp+sequential_5/dense_5/BiasAdd/ReadVariableOp2X
*sequential_5/dense_5/MatMul/ReadVariableOp*sequential_5/dense_5/MatMul/ReadVariableOp2f
1sequential_5/gru_5/gru_cell/MatMul/ReadVariableOp1sequential_5/gru_5/gru_cell/MatMul/ReadVariableOp2j
3sequential_5/gru_5/gru_cell/MatMul_1/ReadVariableOp3sequential_5/gru_5/gru_cell/MatMul_1/ReadVariableOp2X
*sequential_5/gru_5/gru_cell/ReadVariableOp*sequential_5/gru_5/gru_cell/ReadVariableOp24
sequential_5/gru_5/whilesequential_5/gru_5/while:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:T P
+
_output_shapes
:���������
!
_user_specified_name	input_6
�	
�
,__inference_sequential_5_layer_call_fn_80277
input_6
unknown:	�
	unknown_0:	�
	unknown_1:
��
	unknown_2:	�
	unknown_3:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_6unknown	unknown_0	unknown_1	unknown_2	unknown_3*
Tin

2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*'
_read_only_resource_inputs	
*-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_sequential_5_layer_call_and_return_conditional_losses_80091o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:���������: : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name80273:%!

_user_specified_name80271:%!

_user_specified_name80269:%!

_user_specified_name80267:%!

_user_specified_name80265:T P
+
_output_shapes
:���������
!
_user_specified_name	input_6
�
�
while_cond_80914
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_80914___redundant_placeholder03
/while_while_cond_80914___redundant_placeholder13
/while_while_cond_80914___redundant_placeholder23
/while_while_cond_80914___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*A
_input_shapes0
.: : : : :����������: :::::

_output_shapes
::GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�M
�
@__inference_gru_5_layer_call_and_return_conditional_losses_80540
inputs_03
 gru_cell_readvariableop_resource:	�:
'gru_cell_matmul_readvariableop_resource:	�=
)gru_cell_matmul_1_readvariableop_resource:
��
identity��gru_cell/MatMul/ReadVariableOp� gru_cell/MatMul_1/ReadVariableOp�gru_cell/ReadVariableOp�whileK
ShapeShapeinputs_0*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :�s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:����������c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          x
	transpose	Transposeinputs_0transpose/perm:output:0*
T0*4
_output_shapes"
 :������������������R
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
::��_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
����������
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_masky
gru_cell/ReadVariableOpReadVariableOp gru_cell_readvariableop_resource*
_output_shapes
:	�*
dtype0s
gru_cell/unstackUnpackgru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
gru_cell/MatMul/ReadVariableOpReadVariableOp'gru_cell_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype0�
gru_cell/MatMulMatMulstrided_slice_2:output:0&gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAddBiasAddgru_cell/MatMul:product:0gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������c
gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/splitSplit!gru_cell/split/split_dim:output:0gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
 gru_cell/MatMul_1/ReadVariableOpReadVariableOp)gru_cell_matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0�
gru_cell/MatMul_1MatMulzeros:output:0(gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
gru_cell/BiasAdd_1BiasAddgru_cell/MatMul_1:product:0gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������c
gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����e
gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
gru_cell/split_1SplitVgru_cell/BiasAdd_1:output:0gru_cell/Const:output:0#gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split|
gru_cell/addAddV2gru_cell/split:output:0gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������`
gru_cell/SigmoidSigmoidgru_cell/add:z:0*
T0*(
_output_shapes
:����������~
gru_cell/add_1AddV2gru_cell/split:output:1gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������d
gru_cell/Sigmoid_1Sigmoidgru_cell/add_1:z:0*
T0*(
_output_shapes
:����������y
gru_cell/mulMulgru_cell/Sigmoid_1:y:0gru_cell/split_1:output:2*
T0*(
_output_shapes
:����������u
gru_cell/add_2AddV2gru_cell/split:output:2gru_cell/mul:z:0*
T0*(
_output_shapes
:����������\
gru_cell/ReluRelugru_cell/add_2:z:0*
T0*(
_output_shapes
:����������n
gru_cell/mul_1Mulgru_cell/Sigmoid:y:0zeros:output:0*
T0*(
_output_shapes
:����������S
gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?u
gru_cell/subSubgru_cell/sub/x:output:0gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:����������w
gru_cell/mul_2Mulgru_cell/sub:z:0gru_cell/Relu:activations:0*
T0*(
_output_shapes
:����������r
gru_cell/add_3AddV2gru_cell/mul_1:z:0gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   ^
TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0%TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���F
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
���������T
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0 gru_cell_readvariableop_resource'gru_cell_matmul_readvariableop_resource)gru_cell_matmul_1_readvariableop_resource*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*:
_output_shapes(
&: : : : :����������: : : : : *%
_read_only_resource_inputs
	*
bodyR
while_body_80450*
condR
while_cond_80449*9
output_shapes(
&: : : : :����������: : : : : *
parallel_iterations �
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elementsh
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:����������[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:�����������
NoOpNoOp^gru_cell/MatMul/ReadVariableOp!^gru_cell/MatMul_1/ReadVariableOp^gru_cell/ReadVariableOp^while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:������������������: : : 2@
gru_cell/MatMul/ReadVariableOpgru_cell/MatMul/ReadVariableOp2D
 gru_cell/MatMul_1/ReadVariableOp gru_cell/MatMul_1/ReadVariableOp22
gru_cell/ReadVariableOpgru_cell/ReadVariableOp2
whilewhile:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:^ Z
4
_output_shapes"
 :������������������
"
_user_specified_name
inputs_0
�5
�
@__inference_gru_5_layer_call_and_return_conditional_losses_79716

inputs!
gru_cell_79638:	�!
gru_cell_79640:	�"
gru_cell_79642:
��
identity�� gru_cell/StatefulPartitionedCall�whileI
ShapeShapeinputs*
T0*
_output_shapes
::��]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
zeros/packed/1Const*
_output_shapes
: *
dtype0*
value
B :�s
zeros/packedPackstrided_slice:output:0zeros/packed/1:output:0*
N*
T0*
_output_shapes
:P
zeros/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *    m
zerosFillzeros/packed:output:0zeros/Const:output:0*
T0*(
_output_shapes
:����������c
transpose/permConst*
_output_shapes
:*
dtype0*!
valueB"          v
	transpose	Transposeinputstranspose/perm:output:0*
T0*4
_output_shapes"
 :������������������R
Shape_1Shapetranspose:y:0*
T0*
_output_shapes
::��_
strided_slice_1/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_1/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_1/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_1StridedSliceShape_1:output:0strided_slice_1/stack:output:0 strided_slice_1/stack_1:output:0 strided_slice_1/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskf
TensorArrayV2/element_shapeConst*
_output_shapes
: *
dtype0*
valueB :
����������
TensorArrayV2TensorListReserve$TensorArrayV2/element_shape:output:0strided_slice_1:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:����
5TensorArrayUnstack/TensorListFromTensor/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
'TensorArrayUnstack/TensorListFromTensorTensorListFromTensortranspose:y:0>TensorArrayUnstack/TensorListFromTensor/element_shape:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���_
strided_slice_2/stackConst*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_2/stack_1Const*
_output_shapes
:*
dtype0*
valueB:a
strided_slice_2/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_2StridedSlicetranspose:y:0strided_slice_2/stack:output:0 strided_slice_2/stack_1:output:0 strided_slice_2/stack_2:output:0*
Index0*
T0*'
_output_shapes
:���������*
shrink_axis_mask�
 gru_cell/StatefulPartitionedCallStatefulPartitionedCallstrided_slice_2:output:0zeros:output:0gru_cell_79638gru_cell_79640gru_cell_79642*
Tin	
2*
Tout
2*
_collective_manager_ids
 *<
_output_shapes*
(:����������:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_gru_cell_layer_call_and_return_conditional_losses_79637n
TensorArrayV2_1/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   ^
TensorArrayV2_1/num_elementsConst*
_output_shapes
: *
dtype0*
value	B :�
TensorArrayV2_1TensorListReserve&TensorArrayV2_1/element_shape:output:0%TensorArrayV2_1/num_elements:output:0*
_output_shapes
: *
element_dtype0*

shape_type0:���F
timeConst*
_output_shapes
: *
dtype0*
value	B : c
while/maximum_iterationsConst*
_output_shapes
: *
dtype0*
valueB :
���������T
while/loop_counterConst*
_output_shapes
: *
dtype0*
value	B : �
whileWhilewhile/loop_counter:output:0!while/maximum_iterations:output:0time:output:0TensorArrayV2_1:handle:0zeros:output:0strided_slice_1:output:07TensorArrayUnstack/TensorListFromTensor:output_handle:0gru_cell_79638gru_cell_79640gru_cell_79642*
T
2
*
_lower_using_switch_merge(*
_num_original_outputs
*:
_output_shapes(
&: : : : :����������: : : : : *%
_read_only_resource_inputs
	*
bodyR
while_body_79651*
condR
while_cond_79650*9
output_shapes(
&: : : : :����������: : : : : *
parallel_iterations �
0TensorArrayV2Stack/TensorListStack/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"�����   �
"TensorArrayV2Stack/TensorListStackTensorListStackwhile:output:39TensorArrayV2Stack/TensorListStack/element_shape:output:0*,
_output_shapes
:����������*
element_dtype0*
num_elementsh
strided_slice_3/stackConst*
_output_shapes
:*
dtype0*
valueB:
���������a
strided_slice_3/stack_1Const*
_output_shapes
:*
dtype0*
valueB: a
strided_slice_3/stack_2Const*
_output_shapes
:*
dtype0*
valueB:�
strided_slice_3StridedSlice+TensorArrayV2Stack/TensorListStack:tensor:0strided_slice_3/stack:output:0 strided_slice_3/stack_1:output:0 strided_slice_3/stack_2:output:0*
Index0*
T0*(
_output_shapes
:����������*
shrink_axis_maske
transpose_1/permConst*
_output_shapes
:*
dtype0*!
valueB"          �
transpose_1	Transpose+TensorArrayV2Stack/TensorListStack:tensor:0transpose_1/perm:output:0*
T0*,
_output_shapes
:����������[
runtimeConst"/device:CPU:0*
_output_shapes
: *
dtype0*
valueB
 *    h
IdentityIdentitystrided_slice_3:output:0^NoOp*
T0*(
_output_shapes
:����������M
NoOpNoOp!^gru_cell/StatefulPartitionedCall^while*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:������������������: : : 2D
 gru_cell/StatefulPartitionedCall gru_cell/StatefulPartitionedCall2
whilewhile:%!

_user_specified_name79642:%!

_user_specified_name79640:%!

_user_specified_name79638:\ X
4
_output_shapes"
 :������������������
 
_user_specified_nameinputs
�
�
%__inference_gru_5_layer_call_fn_80352
inputs_0
unknown:	�
	unknown_0:	�
	unknown_1:
��
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0unknown	unknown_0	unknown_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_gru_5_layer_call_and_return_conditional_losses_79716p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:������������������: : : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name80348:%!

_user_specified_name80346:%!

_user_specified_name80344:^ Z
4
_output_shapes"
 :������������������
"
_user_specified_name
inputs_0
�
�
G__inference_sequential_5_layer_call_and_return_conditional_losses_80091
input_6
gru_5_80068:	�
gru_5_80070:	�
gru_5_80072:
�� 
dense_5_80085:	�
dense_5_80087:
identity��dense_5/StatefulPartitionedCall�gru_5/StatefulPartitionedCall�
gru_5/StatefulPartitionedCallStatefulPartitionedCallinput_6gru_5_80068gru_5_80070gru_5_80072*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *I
fDRB
@__inference_gru_5_layer_call_and_return_conditional_losses_80067�
dense_5/StatefulPartitionedCallStatefulPartitionedCall&gru_5/StatefulPartitionedCall:output:0dense_5_80085dense_5_80087*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_dense_5_layer_call_and_return_conditional_losses_80084w
IdentityIdentity(dense_5/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������d
NoOpNoOp ^dense_5/StatefulPartitionedCall^gru_5/StatefulPartitionedCall*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*4
_input_shapes#
!:���������: : : : : 2B
dense_5/StatefulPartitionedCalldense_5/StatefulPartitionedCall2>
gru_5/StatefulPartitionedCallgru_5/StatefulPartitionedCall:%!

_user_specified_name80087:%!

_user_specified_name80085:%!

_user_specified_name80072:%!

_user_specified_name80070:%!

_user_specified_name80068:T P
+
_output_shapes
:���������
!
_user_specified_name	input_6
�
�
while_cond_79794
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_less_strided_slice_13
/while_while_cond_79794___redundant_placeholder03
/while_while_cond_79794___redundant_placeholder13
/while_while_cond_79794___redundant_placeholder23
/while_while_cond_79794___redundant_placeholder3
while_identity
b

while/LessLesswhile_placeholderwhile_less_strided_slice_1*
T0*
_output_shapes
: K
while/IdentityIdentitywhile/Less:z:0*
T0
*
_output_shapes
: ")
while_identitywhile/Identity:output:0*(
_construction_contextkEagerRuntime*A
_input_shapes0
.: : : : :����������: :::::

_output_shapes
::GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�"
�
while_body_79651
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0)
while_gru_cell_79673_0:	�)
while_gru_cell_79675_0:	�*
while_gru_cell_79677_0:
��
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor'
while_gru_cell_79673:	�'
while_gru_cell_79675:	�(
while_gru_cell_79677:
����&while/gru_cell/StatefulPartitionedCall�
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0�
&while/gru_cell/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_gru_cell_79673_0while_gru_cell_79675_0while_gru_cell_79677_0*
Tin	
2*
Tout
2*
_collective_manager_ids
 *<
_output_shapes*
(:����������:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_gru_cell_layer_call_and_return_conditional_losses_79637r
0while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_19while/TensorArrayV2Write/TensorListSetItem/index:output:0/while/gru_cell/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype0:���M
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_4Identity/while/gru_cell/StatefulPartitionedCall:output:1^while/NoOp*
T0*(
_output_shapes
:����������Q

while/NoOpNoOp'^while/gru_cell/StatefulPartitionedCall*
_output_shapes
 ".
while_gru_cell_79673while_gru_cell_79673_0".
while_gru_cell_79675while_gru_cell_79675_0".
while_gru_cell_79677while_gru_cell_79677_0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0")
while_identitywhile/Identity:output:0"0
while_strided_slice_1while_strided_slice_1_0"�
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&: : : : :����������: : : : : 2P
&while/gru_cell/StatefulPartitionedCall&while/gru_cell/StatefulPartitionedCall:%	!

_user_specified_name79677:%!

_user_specified_name79675:%!

_user_specified_name79673:_[

_output_shapes
: 
A
_user_specified_name)'TensorArrayUnstack/TensorListFromTensor:GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�
�
C__inference_gru_cell_layer_call_and_return_conditional_losses_81130

inputs
states_0*
readvariableop_resource:	�1
matmul_readvariableop_resource:	�4
 matmul_1_readvariableop_resource:
��
identity

identity_1��MatMul/ReadVariableOp�MatMul_1/ReadVariableOp�ReadVariableOpg
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:	�*
dtype0a
unstackUnpackReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
numu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������i
BiasAddBiasAddMatMul:product:0unstack:output:0*
T0*(
_output_shapes
:����������Z
split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
splitSplitsplit/split_dim:output:0BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_splitz
MatMul_1/ReadVariableOpReadVariableOp matmul_1_readvariableop_resource* 
_output_shapes
:
��*
dtype0p
MatMul_1MatMulstates_0MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:����������m
	BiasAdd_1BiasAddMatMul_1:product:0unstack:output:1*
T0*(
_output_shapes
:����������Z
ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����\
split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
split_1SplitVBiasAdd_1:output:0Const:output:0split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_splita
addAddV2split:output:0split_1:output:0*
T0*(
_output_shapes
:����������N
SigmoidSigmoidadd:z:0*
T0*(
_output_shapes
:����������c
add_1AddV2split:output:1split_1:output:1*
T0*(
_output_shapes
:����������R
	Sigmoid_1Sigmoid	add_1:z:0*
T0*(
_output_shapes
:����������^
mulMulSigmoid_1:y:0split_1:output:2*
T0*(
_output_shapes
:����������Z
add_2AddV2split:output:2mul:z:0*
T0*(
_output_shapes
:����������J
ReluRelu	add_2:z:0*
T0*(
_output_shapes
:����������V
mul_1MulSigmoid:y:0states_0*
T0*(
_output_shapes
:����������J
sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?Z
subSubsub/x:output:0Sigmoid:y:0*
T0*(
_output_shapes
:����������\
mul_2Mulsub:z:0Relu:activations:0*
T0*(
_output_shapes
:����������W
add_3AddV2	mul_1:z:0	mul_2:z:0*
T0*(
_output_shapes
:����������Y
IdentityIdentity	add_3:z:0^NoOp*
T0*(
_output_shapes
:����������[

Identity_1Identity	add_3:z:0^NoOp*
T0*(
_output_shapes
:����������e
NoOpNoOp^MatMul/ReadVariableOp^MatMul_1/ReadVariableOp^ReadVariableOp*
_output_shapes
 "!

identity_1Identity_1:output:0"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-:���������:����������: : : 2.
MatMul/ReadVariableOpMatMul/ReadVariableOp22
MatMul_1/ReadVariableOpMatMul_1/ReadVariableOp2 
ReadVariableOpReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:RN
(
_output_shapes
:����������
"
_user_specified_name
states_0:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
��
�
__inference__traced_save_81248
file_prefix8
%read_disablecopyonread_dense_5_kernel:	�3
%read_1_disablecopyonread_dense_5_bias:A
.read_2_disablecopyonread_gru_5_gru_cell_kernel:	�L
8read_3_disablecopyonread_gru_5_gru_cell_recurrent_kernel:
��?
,read_4_disablecopyonread_gru_5_gru_cell_bias:	�,
"read_5_disablecopyonread_iteration:	 0
&read_6_disablecopyonread_learning_rate: R
?read_7_disablecopyonread_rmsprop_velocity_gru_5_gru_cell_kernel:	�]
Iread_8_disablecopyonread_rmsprop_velocity_gru_5_gru_cell_recurrent_kernel:
��P
=read_9_disablecopyonread_rmsprop_velocity_gru_5_gru_cell_bias:	�L
9read_10_disablecopyonread_rmsprop_velocity_dense_5_kernel:	�E
7read_11_disablecopyonread_rmsprop_velocity_dense_5_bias:+
!read_12_disablecopyonread_total_1: +
!read_13_disablecopyonread_count_1: )
read_14_disablecopyonread_total: )
read_15_disablecopyonread_count: 
savev2_const
identity_33��MergeV2Checkpoints�Read/DisableCopyOnRead�Read/ReadVariableOp�Read_1/DisableCopyOnRead�Read_1/ReadVariableOp�Read_10/DisableCopyOnRead�Read_10/ReadVariableOp�Read_11/DisableCopyOnRead�Read_11/ReadVariableOp�Read_12/DisableCopyOnRead�Read_12/ReadVariableOp�Read_13/DisableCopyOnRead�Read_13/ReadVariableOp�Read_14/DisableCopyOnRead�Read_14/ReadVariableOp�Read_15/DisableCopyOnRead�Read_15/ReadVariableOp�Read_2/DisableCopyOnRead�Read_2/ReadVariableOp�Read_3/DisableCopyOnRead�Read_3/ReadVariableOp�Read_4/DisableCopyOnRead�Read_4/ReadVariableOp�Read_5/DisableCopyOnRead�Read_5/ReadVariableOp�Read_6/DisableCopyOnRead�Read_6/ReadVariableOp�Read_7/DisableCopyOnRead�Read_7/ReadVariableOp�Read_8/DisableCopyOnRead�Read_8/ReadVariableOp�Read_9/DisableCopyOnRead�Read_9/ReadVariableOpw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : �
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: w
Read/DisableCopyOnReadDisableCopyOnRead%read_disablecopyonread_dense_5_kernel"/device:CPU:0*
_output_shapes
 �
Read/ReadVariableOpReadVariableOp%read_disablecopyonread_dense_5_kernel^Read/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0j
IdentityIdentityRead/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�b

Identity_1IdentityIdentity:output:0"/device:CPU:0*
T0*
_output_shapes
:	�y
Read_1/DisableCopyOnReadDisableCopyOnRead%read_1_disablecopyonread_dense_5_bias"/device:CPU:0*
_output_shapes
 �
Read_1/ReadVariableOpReadVariableOp%read_1_disablecopyonread_dense_5_bias^Read_1/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0i

Identity_2IdentityRead_1/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:_

Identity_3IdentityIdentity_2:output:0"/device:CPU:0*
T0*
_output_shapes
:�
Read_2/DisableCopyOnReadDisableCopyOnRead.read_2_disablecopyonread_gru_5_gru_cell_kernel"/device:CPU:0*
_output_shapes
 �
Read_2/ReadVariableOpReadVariableOp.read_2_disablecopyonread_gru_5_gru_cell_kernel^Read_2/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0n

Identity_4IdentityRead_2/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�d

Identity_5IdentityIdentity_4:output:0"/device:CPU:0*
T0*
_output_shapes
:	��
Read_3/DisableCopyOnReadDisableCopyOnRead8read_3_disablecopyonread_gru_5_gru_cell_recurrent_kernel"/device:CPU:0*
_output_shapes
 �
Read_3/ReadVariableOpReadVariableOp8read_3_disablecopyonread_gru_5_gru_cell_recurrent_kernel^Read_3/DisableCopyOnRead"/device:CPU:0* 
_output_shapes
:
��*
dtype0o

Identity_6IdentityRead_3/ReadVariableOp:value:0"/device:CPU:0*
T0* 
_output_shapes
:
��e

Identity_7IdentityIdentity_6:output:0"/device:CPU:0*
T0* 
_output_shapes
:
���
Read_4/DisableCopyOnReadDisableCopyOnRead,read_4_disablecopyonread_gru_5_gru_cell_bias"/device:CPU:0*
_output_shapes
 �
Read_4/ReadVariableOpReadVariableOp,read_4_disablecopyonread_gru_5_gru_cell_bias^Read_4/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0n

Identity_8IdentityRead_4/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�d

Identity_9IdentityIdentity_8:output:0"/device:CPU:0*
T0*
_output_shapes
:	�v
Read_5/DisableCopyOnReadDisableCopyOnRead"read_5_disablecopyonread_iteration"/device:CPU:0*
_output_shapes
 �
Read_5/ReadVariableOpReadVariableOp"read_5_disablecopyonread_iteration^Read_5/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0	f
Identity_10IdentityRead_5/ReadVariableOp:value:0"/device:CPU:0*
T0	*
_output_shapes
: ]
Identity_11IdentityIdentity_10:output:0"/device:CPU:0*
T0	*
_output_shapes
: z
Read_6/DisableCopyOnReadDisableCopyOnRead&read_6_disablecopyonread_learning_rate"/device:CPU:0*
_output_shapes
 �
Read_6/ReadVariableOpReadVariableOp&read_6_disablecopyonread_learning_rate^Read_6/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0f
Identity_12IdentityRead_6/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_13IdentityIdentity_12:output:0"/device:CPU:0*
T0*
_output_shapes
: �
Read_7/DisableCopyOnReadDisableCopyOnRead?read_7_disablecopyonread_rmsprop_velocity_gru_5_gru_cell_kernel"/device:CPU:0*
_output_shapes
 �
Read_7/ReadVariableOpReadVariableOp?read_7_disablecopyonread_rmsprop_velocity_gru_5_gru_cell_kernel^Read_7/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0o
Identity_14IdentityRead_7/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�f
Identity_15IdentityIdentity_14:output:0"/device:CPU:0*
T0*
_output_shapes
:	��
Read_8/DisableCopyOnReadDisableCopyOnReadIread_8_disablecopyonread_rmsprop_velocity_gru_5_gru_cell_recurrent_kernel"/device:CPU:0*
_output_shapes
 �
Read_8/ReadVariableOpReadVariableOpIread_8_disablecopyonread_rmsprop_velocity_gru_5_gru_cell_recurrent_kernel^Read_8/DisableCopyOnRead"/device:CPU:0* 
_output_shapes
:
��*
dtype0p
Identity_16IdentityRead_8/ReadVariableOp:value:0"/device:CPU:0*
T0* 
_output_shapes
:
��g
Identity_17IdentityIdentity_16:output:0"/device:CPU:0*
T0* 
_output_shapes
:
���
Read_9/DisableCopyOnReadDisableCopyOnRead=read_9_disablecopyonread_rmsprop_velocity_gru_5_gru_cell_bias"/device:CPU:0*
_output_shapes
 �
Read_9/ReadVariableOpReadVariableOp=read_9_disablecopyonread_rmsprop_velocity_gru_5_gru_cell_bias^Read_9/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0o
Identity_18IdentityRead_9/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�f
Identity_19IdentityIdentity_18:output:0"/device:CPU:0*
T0*
_output_shapes
:	��
Read_10/DisableCopyOnReadDisableCopyOnRead9read_10_disablecopyonread_rmsprop_velocity_dense_5_kernel"/device:CPU:0*
_output_shapes
 �
Read_10/ReadVariableOpReadVariableOp9read_10_disablecopyonread_rmsprop_velocity_dense_5_kernel^Read_10/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:	�*
dtype0p
Identity_20IdentityRead_10/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:	�f
Identity_21IdentityIdentity_20:output:0"/device:CPU:0*
T0*
_output_shapes
:	��
Read_11/DisableCopyOnReadDisableCopyOnRead7read_11_disablecopyonread_rmsprop_velocity_dense_5_bias"/device:CPU:0*
_output_shapes
 �
Read_11/ReadVariableOpReadVariableOp7read_11_disablecopyonread_rmsprop_velocity_dense_5_bias^Read_11/DisableCopyOnRead"/device:CPU:0*
_output_shapes
:*
dtype0k
Identity_22IdentityRead_11/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
:a
Identity_23IdentityIdentity_22:output:0"/device:CPU:0*
T0*
_output_shapes
:v
Read_12/DisableCopyOnReadDisableCopyOnRead!read_12_disablecopyonread_total_1"/device:CPU:0*
_output_shapes
 �
Read_12/ReadVariableOpReadVariableOp!read_12_disablecopyonread_total_1^Read_12/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_24IdentityRead_12/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_25IdentityIdentity_24:output:0"/device:CPU:0*
T0*
_output_shapes
: v
Read_13/DisableCopyOnReadDisableCopyOnRead!read_13_disablecopyonread_count_1"/device:CPU:0*
_output_shapes
 �
Read_13/ReadVariableOpReadVariableOp!read_13_disablecopyonread_count_1^Read_13/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_26IdentityRead_13/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_27IdentityIdentity_26:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_14/DisableCopyOnReadDisableCopyOnReadread_14_disablecopyonread_total"/device:CPU:0*
_output_shapes
 �
Read_14/ReadVariableOpReadVariableOpread_14_disablecopyonread_total^Read_14/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_28IdentityRead_14/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_29IdentityIdentity_28:output:0"/device:CPU:0*
T0*
_output_shapes
: t
Read_15/DisableCopyOnReadDisableCopyOnReadread_15_disablecopyonread_count"/device:CPU:0*
_output_shapes
 �
Read_15/ReadVariableOpReadVariableOpread_15_disablecopyonread_count^Read_15/DisableCopyOnRead"/device:CPU:0*
_output_shapes
: *
dtype0g
Identity_30IdentityRead_15/ReadVariableOp:value:0"/device:CPU:0*
T0*
_output_shapes
: ]
Identity_31IdentityIdentity_30:output:0"/device:CPU:0*
T0*
_output_shapes
: �
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*�
value�B�B6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB0optimizer/_iterations/.ATTRIBUTES/VARIABLE_VALUEB3optimizer/_learning_rate/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/1/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/2/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/3/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/4/.ATTRIBUTES/VARIABLE_VALUEB1optimizer/_variables/5/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*5
value,B*B B B B B B B B B B B B B B B B B �
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0Identity_1:output:0Identity_3:output:0Identity_5:output:0Identity_7:output:0Identity_9:output:0Identity_11:output:0Identity_13:output:0Identity_15:output:0Identity_17:output:0Identity_19:output:0Identity_21:output:0Identity_23:output:0Identity_25:output:0Identity_27:output:0Identity_29:output:0Identity_31:output:0savev2_const"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 *
dtypes
2	�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*&
 _has_manual_control_dependencies(*
_output_shapes
 i
Identity_32Identityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: U
Identity_33IdentityIdentity_32:output:0^NoOp*
T0*
_output_shapes
: �
NoOpNoOp^MergeV2Checkpoints^Read/DisableCopyOnRead^Read/ReadVariableOp^Read_1/DisableCopyOnRead^Read_1/ReadVariableOp^Read_10/DisableCopyOnRead^Read_10/ReadVariableOp^Read_11/DisableCopyOnRead^Read_11/ReadVariableOp^Read_12/DisableCopyOnRead^Read_12/ReadVariableOp^Read_13/DisableCopyOnRead^Read_13/ReadVariableOp^Read_14/DisableCopyOnRead^Read_14/ReadVariableOp^Read_15/DisableCopyOnRead^Read_15/ReadVariableOp^Read_2/DisableCopyOnRead^Read_2/ReadVariableOp^Read_3/DisableCopyOnRead^Read_3/ReadVariableOp^Read_4/DisableCopyOnRead^Read_4/ReadVariableOp^Read_5/DisableCopyOnRead^Read_5/ReadVariableOp^Read_6/DisableCopyOnRead^Read_6/ReadVariableOp^Read_7/DisableCopyOnRead^Read_7/ReadVariableOp^Read_8/DisableCopyOnRead^Read_8/ReadVariableOp^Read_9/DisableCopyOnRead^Read_9/ReadVariableOp*
_output_shapes
 "#
identity_33Identity_33:output:0*(
_construction_contextkEagerRuntime*7
_input_shapes&
$: : : : : : : : : : : : : : : : : : 2(
MergeV2CheckpointsMergeV2Checkpoints20
Read/DisableCopyOnReadRead/DisableCopyOnRead2*
Read/ReadVariableOpRead/ReadVariableOp24
Read_1/DisableCopyOnReadRead_1/DisableCopyOnRead2.
Read_1/ReadVariableOpRead_1/ReadVariableOp26
Read_10/DisableCopyOnReadRead_10/DisableCopyOnRead20
Read_10/ReadVariableOpRead_10/ReadVariableOp26
Read_11/DisableCopyOnReadRead_11/DisableCopyOnRead20
Read_11/ReadVariableOpRead_11/ReadVariableOp26
Read_12/DisableCopyOnReadRead_12/DisableCopyOnRead20
Read_12/ReadVariableOpRead_12/ReadVariableOp26
Read_13/DisableCopyOnReadRead_13/DisableCopyOnRead20
Read_13/ReadVariableOpRead_13/ReadVariableOp26
Read_14/DisableCopyOnReadRead_14/DisableCopyOnRead20
Read_14/ReadVariableOpRead_14/ReadVariableOp26
Read_15/DisableCopyOnReadRead_15/DisableCopyOnRead20
Read_15/ReadVariableOpRead_15/ReadVariableOp24
Read_2/DisableCopyOnReadRead_2/DisableCopyOnRead2.
Read_2/ReadVariableOpRead_2/ReadVariableOp24
Read_3/DisableCopyOnReadRead_3/DisableCopyOnRead2.
Read_3/ReadVariableOpRead_3/ReadVariableOp24
Read_4/DisableCopyOnReadRead_4/DisableCopyOnRead2.
Read_4/ReadVariableOpRead_4/ReadVariableOp24
Read_5/DisableCopyOnReadRead_5/DisableCopyOnRead2.
Read_5/ReadVariableOpRead_5/ReadVariableOp24
Read_6/DisableCopyOnReadRead_6/DisableCopyOnRead2.
Read_6/ReadVariableOpRead_6/ReadVariableOp24
Read_7/DisableCopyOnReadRead_7/DisableCopyOnRead2.
Read_7/ReadVariableOpRead_7/ReadVariableOp24
Read_8/DisableCopyOnReadRead_8/DisableCopyOnRead2.
Read_8/ReadVariableOpRead_8/ReadVariableOp24
Read_9/DisableCopyOnReadRead_9/DisableCopyOnRead2.
Read_9/ReadVariableOpRead_9/ReadVariableOp:=9

_output_shapes
: 

_user_specified_nameConst:%!

_user_specified_namecount:%!

_user_specified_nametotal:'#
!
_user_specified_name	count_1:'#
!
_user_specified_name	total_1:=9
7
_user_specified_nameRMSprop/velocity/dense_5/bias:?;
9
_user_specified_name!RMSprop/velocity/dense_5/kernel:D
@
>
_user_specified_name&$RMSprop/velocity/gru_5/gru_cell/bias:P	L
J
_user_specified_name20RMSprop/velocity/gru_5/gru_cell/recurrent_kernel:FB
@
_user_specified_name(&RMSprop/velocity/gru_5/gru_cell/kernel:-)
'
_user_specified_namelearning_rate:)%
#
_user_specified_name	iteration:3/
-
_user_specified_namegru_5/gru_cell/bias:?;
9
_user_specified_name!gru_5/gru_cell/recurrent_kernel:51
/
_user_specified_namegru_5/gru_cell/kernel:,(
&
_user_specified_namedense_5/bias:.*
(
_user_specified_namedense_5/kernel:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�>
�
while_body_80158
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0;
(while_gru_cell_readvariableop_resource_0:	�B
/while_gru_cell_matmul_readvariableop_resource_0:	�E
1while_gru_cell_matmul_1_readvariableop_resource_0:
��
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor9
&while_gru_cell_readvariableop_resource:	�@
-while_gru_cell_matmul_readvariableop_resource:	�C
/while_gru_cell_matmul_1_readvariableop_resource:
����$while/gru_cell/MatMul/ReadVariableOp�&while/gru_cell/MatMul_1/ReadVariableOp�while/gru_cell/ReadVariableOp�
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0�
while/gru_cell/ReadVariableOpReadVariableOp(while_gru_cell_readvariableop_resource_0*
_output_shapes
:	�*
dtype0
while/gru_cell/unstackUnpack%while/gru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
$while/gru_cell/MatMul/ReadVariableOpReadVariableOp/while_gru_cell_matmul_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
while/gru_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0,while/gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAddBiasAddwhile/gru_cell/MatMul:product:0while/gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������i
while/gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/splitSplit'while/gru_cell/split/split_dim:output:0while/gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
&while/gru_cell/MatMul_1/ReadVariableOpReadVariableOp1while_gru_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
��*
dtype0�
while/gru_cell/MatMul_1MatMulwhile_placeholder_2.while/gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAdd_1BiasAdd!while/gru_cell/MatMul_1:product:0while/gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������i
while/gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����k
 while/gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/split_1SplitV!while/gru_cell/BiasAdd_1:output:0while/gru_cell/Const:output:0)while/gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
while/gru_cell/addAddV2while/gru_cell/split:output:0while/gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������l
while/gru_cell/SigmoidSigmoidwhile/gru_cell/add:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_1AddV2while/gru_cell/split:output:1while/gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������p
while/gru_cell/Sigmoid_1Sigmoidwhile/gru_cell/add_1:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mulMulwhile/gru_cell/Sigmoid_1:y:0while/gru_cell/split_1:output:2*
T0*(
_output_shapes
:�����������
while/gru_cell/add_2AddV2while/gru_cell/split:output:2while/gru_cell/mul:z:0*
T0*(
_output_shapes
:����������h
while/gru_cell/ReluReluwhile/gru_cell/add_2:z:0*
T0*(
_output_shapes
:����������
while/gru_cell/mul_1Mulwhile/gru_cell/Sigmoid:y:0while_placeholder_2*
T0*(
_output_shapes
:����������Y
while/gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
while/gru_cell/subSubwhile/gru_cell/sub/x:output:0while/gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mul_2Mulwhile/gru_cell/sub:z:0!while/gru_cell/Relu:activations:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_3AddV2while/gru_cell/mul_1:z:0while/gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������r
0while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_19while/TensorArrayV2Write/TensorListSetItem/index:output:0while/gru_cell/add_3:z:0*
_output_shapes
: *
element_dtype0:���M
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: v
while/Identity_4Identitywhile/gru_cell/add_3:z:0^while/NoOp*
T0*(
_output_shapes
:�����������

while/NoOpNoOp%^while/gru_cell/MatMul/ReadVariableOp'^while/gru_cell/MatMul_1/ReadVariableOp^while/gru_cell/ReadVariableOp*
_output_shapes
 "d
/while_gru_cell_matmul_1_readvariableop_resource1while_gru_cell_matmul_1_readvariableop_resource_0"`
-while_gru_cell_matmul_readvariableop_resource/while_gru_cell_matmul_readvariableop_resource_0"R
&while_gru_cell_readvariableop_resource(while_gru_cell_readvariableop_resource_0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0")
while_identitywhile/Identity:output:0"0
while_strided_slice_1while_strided_slice_1_0"�
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&: : : : :����������: : : : : 2L
$while/gru_cell/MatMul/ReadVariableOp$while/gru_cell/MatMul/ReadVariableOp2P
&while/gru_cell/MatMul_1/ReadVariableOp&while/gru_cell/MatMul_1/ReadVariableOp2>
while/gru_cell/ReadVariableOpwhile/gru_cell/ReadVariableOp:(	$
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:_[

_output_shapes
: 
A
_user_specified_name)'TensorArrayUnstack/TensorListFromTensor:GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�"
�
while_body_79795
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0)
while_gru_cell_79817_0:	�)
while_gru_cell_79819_0:	�*
while_gru_cell_79821_0:
��
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor'
while_gru_cell_79817:	�'
while_gru_cell_79819:	�(
while_gru_cell_79821:
����&while/gru_cell/StatefulPartitionedCall�
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0�
&while/gru_cell/StatefulPartitionedCallStatefulPartitionedCall0while/TensorArrayV2Read/TensorListGetItem:item:0while_placeholder_2while_gru_cell_79817_0while_gru_cell_79819_0while_gru_cell_79821_0*
Tin	
2*
Tout
2*
_collective_manager_ids
 *<
_output_shapes*
(:����������:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_gru_cell_layer_call_and_return_conditional_losses_79781r
0while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_19while/TensorArrayV2Write/TensorListSetItem/index:output:0/while/gru_cell/StatefulPartitionedCall:output:0*
_output_shapes
: *
element_dtype0:���M
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_4Identity/while/gru_cell/StatefulPartitionedCall:output:1^while/NoOp*
T0*(
_output_shapes
:����������Q

while/NoOpNoOp'^while/gru_cell/StatefulPartitionedCall*
_output_shapes
 ".
while_gru_cell_79817while_gru_cell_79817_0".
while_gru_cell_79819while_gru_cell_79819_0".
while_gru_cell_79821while_gru_cell_79821_0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0")
while_identitywhile/Identity:output:0"0
while_strided_slice_1while_strided_slice_1_0"�
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&: : : : :����������: : : : : 2P
&while/gru_cell/StatefulPartitionedCall&while/gru_cell/StatefulPartitionedCall:%	!

_user_specified_name79821:%!

_user_specified_name79819:%!

_user_specified_name79817:_[

_output_shapes
: 
A
_user_specified_name)'TensorArrayUnstack/TensorListFromTensor:GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�>
�
while_body_80605
while_while_loop_counter"
while_while_maximum_iterations
while_placeholder
while_placeholder_1
while_placeholder_2
while_strided_slice_1_0W
Swhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0;
(while_gru_cell_readvariableop_resource_0:	�B
/while_gru_cell_matmul_readvariableop_resource_0:	�E
1while_gru_cell_matmul_1_readvariableop_resource_0:
��
while_identity
while_identity_1
while_identity_2
while_identity_3
while_identity_4
while_strided_slice_1U
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor9
&while_gru_cell_readvariableop_resource:	�@
-while_gru_cell_matmul_readvariableop_resource:	�C
/while_gru_cell_matmul_1_readvariableop_resource:
����$while/gru_cell/MatMul/ReadVariableOp�&while/gru_cell/MatMul_1/ReadVariableOp�while/gru_cell/ReadVariableOp�
7while/TensorArrayV2Read/TensorListGetItem/element_shapeConst*
_output_shapes
:*
dtype0*
valueB"����   �
)while/TensorArrayV2Read/TensorListGetItemTensorListGetItemSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0while_placeholder@while/TensorArrayV2Read/TensorListGetItem/element_shape:output:0*'
_output_shapes
:���������*
element_dtype0�
while/gru_cell/ReadVariableOpReadVariableOp(while_gru_cell_readvariableop_resource_0*
_output_shapes
:	�*
dtype0
while/gru_cell/unstackUnpack%while/gru_cell/ReadVariableOp:value:0*
T0*"
_output_shapes
:�:�*	
num�
$while/gru_cell/MatMul/ReadVariableOpReadVariableOp/while_gru_cell_matmul_readvariableop_resource_0*
_output_shapes
:	�*
dtype0�
while/gru_cell/MatMulMatMul0while/TensorArrayV2Read/TensorListGetItem:item:0,while/gru_cell/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAddBiasAddwhile/gru_cell/MatMul:product:0while/gru_cell/unstack:output:0*
T0*(
_output_shapes
:����������i
while/gru_cell/split/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/splitSplit'while/gru_cell/split/split_dim:output:0while/gru_cell/BiasAdd:output:0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
&while/gru_cell/MatMul_1/ReadVariableOpReadVariableOp1while_gru_cell_matmul_1_readvariableop_resource_0* 
_output_shapes
:
��*
dtype0�
while/gru_cell/MatMul_1MatMulwhile_placeholder_2.while/gru_cell/MatMul_1/ReadVariableOp:value:0*
T0*(
_output_shapes
:�����������
while/gru_cell/BiasAdd_1BiasAdd!while/gru_cell/MatMul_1:product:0while/gru_cell/unstack:output:1*
T0*(
_output_shapes
:����������i
while/gru_cell/ConstConst*
_output_shapes
:*
dtype0*!
valueB"�   �   ����k
 while/gru_cell/split_1/split_dimConst*
_output_shapes
: *
dtype0*
valueB :
����������
while/gru_cell/split_1SplitV!while/gru_cell/BiasAdd_1:output:0while/gru_cell/Const:output:0)while/gru_cell/split_1/split_dim:output:0*

Tlen0*
T0*P
_output_shapes>
<:����������:����������:����������*
	num_split�
while/gru_cell/addAddV2while/gru_cell/split:output:0while/gru_cell/split_1:output:0*
T0*(
_output_shapes
:����������l
while/gru_cell/SigmoidSigmoidwhile/gru_cell/add:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_1AddV2while/gru_cell/split:output:1while/gru_cell/split_1:output:1*
T0*(
_output_shapes
:����������p
while/gru_cell/Sigmoid_1Sigmoidwhile/gru_cell/add_1:z:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mulMulwhile/gru_cell/Sigmoid_1:y:0while/gru_cell/split_1:output:2*
T0*(
_output_shapes
:�����������
while/gru_cell/add_2AddV2while/gru_cell/split:output:2while/gru_cell/mul:z:0*
T0*(
_output_shapes
:����������h
while/gru_cell/ReluReluwhile/gru_cell/add_2:z:0*
T0*(
_output_shapes
:����������
while/gru_cell/mul_1Mulwhile/gru_cell/Sigmoid:y:0while_placeholder_2*
T0*(
_output_shapes
:����������Y
while/gru_cell/sub/xConst*
_output_shapes
: *
dtype0*
valueB
 *  �?�
while/gru_cell/subSubwhile/gru_cell/sub/x:output:0while/gru_cell/Sigmoid:y:0*
T0*(
_output_shapes
:�����������
while/gru_cell/mul_2Mulwhile/gru_cell/sub:z:0!while/gru_cell/Relu:activations:0*
T0*(
_output_shapes
:�����������
while/gru_cell/add_3AddV2while/gru_cell/mul_1:z:0while/gru_cell/mul_2:z:0*
T0*(
_output_shapes
:����������r
0while/TensorArrayV2Write/TensorListSetItem/indexConst*
_output_shapes
: *
dtype0*
value	B : �
*while/TensorArrayV2Write/TensorListSetItemTensorListSetItemwhile_placeholder_19while/TensorArrayV2Write/TensorListSetItem/index:output:0while/gru_cell/add_3:z:0*
_output_shapes
: *
element_dtype0:���M
while/add/yConst*
_output_shapes
: *
dtype0*
value	B :\
	while/addAddV2while_placeholderwhile/add/y:output:0*
T0*
_output_shapes
: O
while/add_1/yConst*
_output_shapes
: *
dtype0*
value	B :g
while/add_1AddV2while_while_loop_counterwhile/add_1/y:output:0*
T0*
_output_shapes
: Y
while/IdentityIdentitywhile/add_1:z:0^while/NoOp*
T0*
_output_shapes
: j
while/Identity_1Identitywhile_while_maximum_iterations^while/NoOp*
T0*
_output_shapes
: Y
while/Identity_2Identitywhile/add:z:0^while/NoOp*
T0*
_output_shapes
: �
while/Identity_3Identity:while/TensorArrayV2Write/TensorListSetItem:output_handle:0^while/NoOp*
T0*
_output_shapes
: v
while/Identity_4Identitywhile/gru_cell/add_3:z:0^while/NoOp*
T0*(
_output_shapes
:�����������

while/NoOpNoOp%^while/gru_cell/MatMul/ReadVariableOp'^while/gru_cell/MatMul_1/ReadVariableOp^while/gru_cell/ReadVariableOp*
_output_shapes
 "d
/while_gru_cell_matmul_1_readvariableop_resource1while_gru_cell_matmul_1_readvariableop_resource_0"`
-while_gru_cell_matmul_readvariableop_resource/while_gru_cell_matmul_readvariableop_resource_0"R
&while_gru_cell_readvariableop_resource(while_gru_cell_readvariableop_resource_0"-
while_identity_1while/Identity_1:output:0"-
while_identity_2while/Identity_2:output:0"-
while_identity_3while/Identity_3:output:0"-
while_identity_4while/Identity_4:output:0")
while_identitywhile/Identity:output:0"0
while_strided_slice_1while_strided_slice_1_0"�
Qwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensorSwhile_tensorarrayv2read_tensorlistgetitem_tensorarrayunstack_tensorlistfromtensor_0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&: : : : :����������: : : : : 2L
$while/gru_cell/MatMul/ReadVariableOp$while/gru_cell/MatMul/ReadVariableOp2P
&while/gru_cell/MatMul_1/ReadVariableOp&while/gru_cell/MatMul_1/ReadVariableOp2>
while/gru_cell/ReadVariableOpwhile/gru_cell/ReadVariableOp:(	$
"
_user_specified_name
resource:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:_[

_output_shapes
: 
A
_user_specified_name)'TensorArrayUnstack/TensorListFromTensor:GC

_output_shapes
: 
)
_user_specified_namestrided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :PL

_output_shapes
: 
2
_user_specified_namewhile/maximum_iterations:J F

_output_shapes
: 
,
_user_specified_namewhile/loop_counter
�
�
#sequential_5_gru_5_while_cond_79475B
>sequential_5_gru_5_while_sequential_5_gru_5_while_loop_counterH
Dsequential_5_gru_5_while_sequential_5_gru_5_while_maximum_iterations(
$sequential_5_gru_5_while_placeholder*
&sequential_5_gru_5_while_placeholder_1*
&sequential_5_gru_5_while_placeholder_2D
@sequential_5_gru_5_while_less_sequential_5_gru_5_strided_slice_1Y
Usequential_5_gru_5_while_sequential_5_gru_5_while_cond_79475___redundant_placeholder0Y
Usequential_5_gru_5_while_sequential_5_gru_5_while_cond_79475___redundant_placeholder1Y
Usequential_5_gru_5_while_sequential_5_gru_5_while_cond_79475___redundant_placeholder2Y
Usequential_5_gru_5_while_sequential_5_gru_5_while_cond_79475___redundant_placeholder3%
!sequential_5_gru_5_while_identity
�
sequential_5/gru_5/while/LessLess$sequential_5_gru_5_while_placeholder@sequential_5_gru_5_while_less_sequential_5_gru_5_strided_slice_1*
T0*
_output_shapes
: q
!sequential_5/gru_5/while/IdentityIdentity!sequential_5/gru_5/while/Less:z:0*
T0
*
_output_shapes
: "O
!sequential_5_gru_5_while_identity*sequential_5/gru_5/while/Identity:output:0*(
_construction_contextkEagerRuntime*A
_input_shapes0
.: : : : :����������: :::::

_output_shapes
::ZV

_output_shapes
: 
<
_user_specified_name$"sequential_5/gru_5/strided_slice_1:.*
(
_output_shapes
:����������:

_output_shapes
: :

_output_shapes
: :c_

_output_shapes
: 
E
_user_specified_name-+sequential_5/gru_5/while/maximum_iterations:] Y

_output_shapes
: 
?
_user_specified_name'%sequential_5/gru_5/while/loop_counter
�	
�
B__inference_dense_5_layer_call_and_return_conditional_losses_80084

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:���������S
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:($
"
_user_specified_name
resource:($
"
_user_specified_name
resource:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
(__inference_gru_cell_layer_call_fn_81052

inputs
states_0
unknown:	�
	unknown_0:	�
	unknown_1:
��
identity

identity_1��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsstates_0unknown	unknown_0	unknown_1*
Tin	
2*
Tout
2*
_collective_manager_ids
 *<
_output_shapes*
(:����������:����������*%
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_gru_cell_layer_call_and_return_conditional_losses_79781p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������r

Identity_1Identity StatefulPartitionedCall:output:1^NoOp*
T0*(
_output_shapes
:����������<
NoOpNoOp^StatefulPartitionedCall*
_output_shapes
 "!

identity_1Identity_1:output:0"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*@
_input_shapes/
-:���������:����������: : : 22
StatefulPartitionedCallStatefulPartitionedCall:%!

_user_specified_name81046:%!

_user_specified_name81044:%!

_user_specified_name81042:RN
(
_output_shapes
:����������
"
_user_specified_name
states_0:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
?
input_64
serving_default_input_6:0���������;
dense_50
StatefulPartitionedCall:0���������tensorflow/serving/predict:��
�
layer_with_weights-0
layer-0
layer_with_weights-1
layer-1
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
	_default_save_signature

	optimizer

signatures"
_tf_keras_sequential
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_random_generator
cell

state_spec"
_tf_keras_rnn_layer
�
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
C
0
1
2
3
4"
trackable_list_wrapper
C
0
1
2
3
4"
trackable_list_wrapper
 "
trackable_list_wrapper
�
 non_trainable_variables

!layers
"metrics
#layer_regularization_losses
$layer_metrics
	variables
trainable_variables
regularization_losses
__call__
	_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
%trace_0
&trace_12�
,__inference_sequential_5_layer_call_fn_80277
,__inference_sequential_5_layer_call_fn_80292�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z%trace_0z&trace_1
�
'trace_0
(trace_12�
G__inference_sequential_5_layer_call_and_return_conditional_losses_80091
G__inference_sequential_5_layer_call_and_return_conditional_losses_80262�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z'trace_0z(trace_1
�B�
 __inference__wrapped_model_79572input_6"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�
)
_variables
*_iterations
+_learning_rate
,_index_dict
-_velocities
.
_momentums
/_average_gradients
0_update_step_xla"
experimentalOptimizer
,
1serving_default"
signature_map
5
0
1
2"
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
�

2states
3non_trainable_variables

4layers
5metrics
6layer_regularization_losses
7layer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
8trace_0
9trace_1
:trace_2
;trace_32�
%__inference_gru_5_layer_call_fn_80352
%__inference_gru_5_layer_call_fn_80363
%__inference_gru_5_layer_call_fn_80374
%__inference_gru_5_layer_call_fn_80385�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z8trace_0z9trace_1z:trace_2z;trace_3
�
<trace_0
=trace_1
>trace_2
?trace_32�
@__inference_gru_5_layer_call_and_return_conditional_losses_80540
@__inference_gru_5_layer_call_and_return_conditional_losses_80695
@__inference_gru_5_layer_call_and_return_conditional_losses_80850
@__inference_gru_5_layer_call_and_return_conditional_losses_81005�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z<trace_0z=trace_1z>trace_2z?trace_3
"
_generic_user_object
�
@	variables
Atrainable_variables
Bregularization_losses
C	keras_api
D__call__
*E&call_and_return_all_conditional_losses
F_random_generator

kernel
recurrent_kernel
bias"
_tf_keras_layer
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
�
Gnon_trainable_variables

Hlayers
Imetrics
Jlayer_regularization_losses
Klayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
�
Ltrace_02�
'__inference_dense_5_layer_call_fn_81014�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zLtrace_0
�
Mtrace_02�
B__inference_dense_5_layer_call_and_return_conditional_losses_81024�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zMtrace_0
!:	�2dense_5/kernel
:2dense_5/bias
(:&	�2gru_5/gru_cell/kernel
3:1
��2gru_5/gru_cell/recurrent_kernel
&:$	�2gru_5/gru_cell/bias
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
.
N0
O1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
,__inference_sequential_5_layer_call_fn_80277input_6"�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
,__inference_sequential_5_layer_call_fn_80292input_6"�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
G__inference_sequential_5_layer_call_and_return_conditional_losses_80091input_6"�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
G__inference_sequential_5_layer_call_and_return_conditional_losses_80262input_6"�
���
FullArgSpec)
args!�
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
J
*0
P1
Q2
R3
S4
T5"
trackable_list_wrapper
:	 2	iteration
: 2learning_rate
 "
trackable_dict_wrapper
C
P0
Q1
R2
S3
T4"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�2��
���
FullArgSpec*
args"�

jgradient

jvariable
jkey
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 0
�B�
#__inference_signature_wrapper_80341input_6"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
'
0"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
%__inference_gru_5_layer_call_fn_80352inputs_0"�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
%__inference_gru_5_layer_call_fn_80363inputs_0"�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
%__inference_gru_5_layer_call_fn_80374inputs"�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
%__inference_gru_5_layer_call_fn_80385inputs"�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
@__inference_gru_5_layer_call_and_return_conditional_losses_80540inputs_0"�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
@__inference_gru_5_layer_call_and_return_conditional_losses_80695inputs_0"�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
@__inference_gru_5_layer_call_and_return_conditional_losses_80850inputs"�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
@__inference_gru_5_layer_call_and_return_conditional_losses_81005inputs"�
���
FullArgSpec:
args2�/
jinputs
jmask

jtraining
jinitial_state
varargs
 
varkw
 
defaults�

 
p 

 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
5
0
1
2"
trackable_list_wrapper
5
0
1
2"
trackable_list_wrapper
 "
trackable_list_wrapper
�
Unon_trainable_variables

Vlayers
Wmetrics
Xlayer_regularization_losses
Ylayer_metrics
@	variables
Atrainable_variables
Bregularization_losses
D__call__
*E&call_and_return_all_conditional_losses
&E"call_and_return_conditional_losses"
_generic_user_object
�
Ztrace_0
[trace_12�
(__inference_gru_cell_layer_call_fn_81038
(__inference_gru_cell_layer_call_fn_81052�
���
FullArgSpec+
args#� 
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 zZtrace_0z[trace_1
�
\trace_0
]trace_12�
C__inference_gru_cell_layer_call_and_return_conditional_losses_81091
C__inference_gru_cell_layer_call_and_return_conditional_losses_81130�
���
FullArgSpec+
args#� 
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 z\trace_0z]trace_1
"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
'__inference_dense_5_layer_call_fn_81014inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
B__inference_dense_5_layer_call_and_return_conditional_losses_81024inputs"�
���
FullArgSpec
args�

jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
N
^	variables
_	keras_api
	`total
	acount"
_tf_keras_metric
^
b	variables
c	keras_api
	dtotal
	ecount
f
_fn_kwargs"
_tf_keras_metric
7:5	�2&RMSprop/velocity/gru_5/gru_cell/kernel
B:@
��20RMSprop/velocity/gru_5/gru_cell/recurrent_kernel
5:3	�2$RMSprop/velocity/gru_5/gru_cell/bias
0:.	�2RMSprop/velocity/dense_5/kernel
):'2RMSprop/velocity/dense_5/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
�B�
(__inference_gru_cell_layer_call_fn_81038inputsstates_0"�
���
FullArgSpec+
args#� 
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
(__inference_gru_cell_layer_call_fn_81052inputsstates_0"�
���
FullArgSpec+
args#� 
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
C__inference_gru_cell_layer_call_and_return_conditional_losses_81091inputsstates_0"�
���
FullArgSpec+
args#� 
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�B�
C__inference_gru_cell_layer_call_and_return_conditional_losses_81130inputsstates_0"�
���
FullArgSpec+
args#� 
jinputs
jstates

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
.
`0
a1"
trackable_list_wrapper
-
^	variables"
_generic_user_object
:  (2total
:  (2count
.
d0
e1"
trackable_list_wrapper
-
b	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper�
 __inference__wrapped_model_79572p4�1
*�'
%�"
input_6���������
� "1�.
,
dense_5!�
dense_5����������
B__inference_dense_5_layer_call_and_return_conditional_losses_81024d0�-
&�#
!�
inputs����������
� ",�)
"�
tensor_0���������
� �
'__inference_dense_5_layer_call_fn_81014Y0�-
&�#
!�
inputs����������
� "!�
unknown����������
@__inference_gru_5_layer_call_and_return_conditional_losses_80540�O�L
E�B
4�1
/�,
inputs_0������������������

 
p

 
� "-�*
#� 
tensor_0����������
� �
@__inference_gru_5_layer_call_and_return_conditional_losses_80695�O�L
E�B
4�1
/�,
inputs_0������������������

 
p 

 
� "-�*
#� 
tensor_0����������
� �
@__inference_gru_5_layer_call_and_return_conditional_losses_80850u?�<
5�2
$�!
inputs���������

 
p

 
� "-�*
#� 
tensor_0����������
� �
@__inference_gru_5_layer_call_and_return_conditional_losses_81005u?�<
5�2
$�!
inputs���������

 
p 

 
� "-�*
#� 
tensor_0����������
� �
%__inference_gru_5_layer_call_fn_80352zO�L
E�B
4�1
/�,
inputs_0������������������

 
p

 
� ""�
unknown�����������
%__inference_gru_5_layer_call_fn_80363zO�L
E�B
4�1
/�,
inputs_0������������������

 
p 

 
� ""�
unknown�����������
%__inference_gru_5_layer_call_fn_80374j?�<
5�2
$�!
inputs���������

 
p

 
� ""�
unknown�����������
%__inference_gru_5_layer_call_fn_80385j?�<
5�2
$�!
inputs���������

 
p 

 
� ""�
unknown�����������
C__inference_gru_cell_layer_call_and_return_conditional_losses_81091�]�Z
S�P
 �
inputs���������
(�%
#� 
states_0����������
p
� "b�_
X�U
%�"

tensor_0_0����������
,�)
'�$
tensor_0_1_0����������
� �
C__inference_gru_cell_layer_call_and_return_conditional_losses_81130�]�Z
S�P
 �
inputs���������
(�%
#� 
states_0����������
p 
� "b�_
X�U
%�"

tensor_0_0����������
,�)
'�$
tensor_0_1_0����������
� �
(__inference_gru_cell_layer_call_fn_81038�]�Z
S�P
 �
inputs���������
(�%
#� 
states_0����������
p
� "T�Q
#� 
tensor_0����������
*�'
%�"

tensor_1_0�����������
(__inference_gru_cell_layer_call_fn_81052�]�Z
S�P
 �
inputs���������
(�%
#� 
states_0����������
p 
� "T�Q
#� 
tensor_0����������
*�'
%�"

tensor_1_0�����������
G__inference_sequential_5_layer_call_and_return_conditional_losses_80091s<�9
2�/
%�"
input_6���������
p

 
� ",�)
"�
tensor_0���������
� �
G__inference_sequential_5_layer_call_and_return_conditional_losses_80262s<�9
2�/
%�"
input_6���������
p 

 
� ",�)
"�
tensor_0���������
� �
,__inference_sequential_5_layer_call_fn_80277h<�9
2�/
%�"
input_6���������
p

 
� "!�
unknown����������
,__inference_sequential_5_layer_call_fn_80292h<�9
2�/
%�"
input_6���������
p 

 
� "!�
unknown����������
#__inference_signature_wrapper_80341{?�<
� 
5�2
0
input_6%�"
input_6���������"1�.
,
dense_5!�
dense_5���������