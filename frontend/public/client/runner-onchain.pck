GDPC                  	                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn�       �      8n����u-�jS-���    T   res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn  �r      �      �R�B�\�8����Zu�    X   res://.godot/exported/133200997/export-5a389fca546c2136f90f8ffaf39b7e2d-start_gui.scn   �}      T      ���%m���R
~�    \   res://.godot/exported/133200997/export-db8b4edb8aff38bd8f0900642dcf6ca4-game_over_gui.scn   �      �      �H aDB��3:Q�$d    P   res://.godot/exported/133200997/export-e6d97c4feb736ad10c0d43b3f8310ea4-map.scn �*      �E      ��~��������t�?=    P   res://.godot/exported/133200997/export-f4cf891e5f7a93b93d9b27cfb8401ccb-hud.scn �             �m�iۃƚS���eo�e    ,   res://.godot/global_script_class_cache.cfg  p�      �       � ��DR<w���~�Ԗ    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      �Yz=������������       res://.godot/uid_cache.bin  ��      �       H�q��4�D��U       res://Globals.gdp            v5�H�1ܒD�;=.+�       res://Signals.gdp|      z        �u���ڡv��(����       res://example_mapdata.json          t      y竂���y��8�\       res://game_over_gui.gd  �      "      w3��V�3ם0�f��        res://game_over_gui.tscn.remap  ��      j       !
�� '&/p�/;pj�       res://hud.gd�            ���,�� �I�¹��o       res://hud.tscn.remap`�      `       L�
�H��l�YB��       res://icon.svg   �      �      C��=U���^Qu��U3       res://icon.svg.import   �      �       �E9#i��%����Ne_       res://main.gd   `            Y*�闼W���$o��       res://main.tscn.remap   ��      a       �J�Sw� ������       res://map.gd0$      �      �
�xn�d��y�F�D�       res://map.tscn.remap0�      `       �]� ��!�vQ�H�:n       res://player.gd `p      5      �4b�)�p")(�       res://player.tscn.remap ��      c       ������T�?�L���       res://project.binary��      �      ��Ø�&g@��Ī�       res://recorder.gd   �v      �      ��0w�%��x�?q�       res://start_gui.gd  �|      �       ³{��k�j����A�c       res://start_gui.tscn.remap   �      f       ���M�K@��X���
�       res://ui.gd  �      �      &H��M�k��1��I�    {
    "tiles": [
        ["list of", "uint256", "binpacked", "max 4"],
        ["one list per row", "one bit per tile", "build left to right"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"],
        ["array length", "20", "to match map height"]
    ]
}            extends CenterContainer

func _ready():
	$VBoxContainer/Label.text = str(Globals.distance)

func _on_restart_pressed():
	print_debug("Restarting game")
	Signals.start_game.emit()


func _on_submit_pressed():
	Recorder.publish_game_log()
	$VBoxContainer/HBoxContainer/Submit.disabled = true
              RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://game_over_gui.gd ��������      local://PackedScene_jwdw1          PackedScene          	         names "         GameOverGUI    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    size_flags_horizontal    size_flags_vertical    script    CenterContainer    VBoxContainer    layout_mode    Label    horizontal_alignment    vertical_alignment    HBoxContainer    Restart    text    Button    Submit    _on_restart_pressed    pressed    _on_submit_pressed    	   variants    	        �?     ��     x�                                  Restart       Submit       node_count             nodes     R   ��������       ����                                                     	      
                              ����                          ����                                      ����                          ����                                ����                         conn_count             conns                                                              node_paths              editable_instances              version             RSRC    extends Node

var distance:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_start_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_start_game():
	distance = 0
             extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$Label.text = str(Globals.distance)
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://hud.gd ��������      local://PackedScene_ggpv1          PackedScene          	         names "         HUD    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    size_flags_horizontal    size_flags_vertical    script    CenterContainer    Label    layout_mode    text    	   variants            �?     ��     x�                            SCORE       node_count             nodes     (   ��������       ����                                                     	      
                              ����                         conn_count              conns               node_paths              editable_instances              version             RSRCGST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح����mow�*��f�&��Cp�ȑD_��ٮ}�)� C+���UE��tlp�V/<p��ҕ�ig���E�W�����Sթ�� ӗ�A~@2�E�G"���~ ��5tQ#�+�@.ݡ�i۳�3�5�l��^c��=�x�Н&rA��a�lN��TgK㼧�)݉J�N���I�9��R���$`��[���=i�QgK�4c��%�*�D#I-�<�)&a��J�� ���d+�-Ֆ
��Ζ���Ut��(Q�h:�K��xZ�-��b��ٞ%+�]�p�yFV�F'����kd�^���:[Z��/��ʡy�����EJo�񷰼s�ɿ�A���N�O��Y��D��8�c)���TZ6�7m�A��\oE�hZ�{YJ�)u\a{W��>�?�]���+T�<o�{dU�`��5�Hf1�ۗ�j�b�2�,%85�G.�A�J�"���i��e)!	�Z؊U�u�X��j�c�_�r�`֩A�O��X5��F+YNL��A��ƩƗp��ױب���>J�[a|	�J��;�ʴb���F�^�PT�s�)+Xe)qL^wS�`�)%��9�x��bZ��y
Y4�F����$G�$�Rz����[���lu�ie)qN��K�<)�:�,�=�ۼ�R����x��5�'+X�OV�<���F[�g=w[-�A�����v����$+��Ҳ�i����*���	�e͙�Y���:5FM{6�����d)锵Z�*ʹ�v�U+�9�\���������P�e-��Eb)j�y��RwJ�6��Mrd\�pyYJ���t�mMO�'a8�R4��̍ﾒX��R�Vsb|q�id)	�ݛ��GR��$p�����Y��$r�J��^hi�̃�ūu'2+��s�rp�&��U��Pf��+�7�:w��|��EUe�`����$G�C�q�ō&1ŎG�s� Dq�Q�{�p��x���|��S%��<
\�n���9�X�_�y���6]���մ�Ŝt�q�<�RW����A �y��ػ����������p�7�l���?�:������*.ո;i��5�	 Ύ�ș`D*�JZA����V^���%�~������1�#�a'a*�;Qa�y�b��[��'[�"a���H�$��4� ���	j�ô7�xS�@�W�@ ��DF"���X����4g��'4��F�@ ����ܿ� ���e�~�U�T#�x��)vr#�Q��?���2��]i�{8>9^[�� �4�2{�F'&����|���|�.�?��Ȩ"�� 3Tp��93/Dp>ϙ�@�B�\���E��#��YA 7 `�2"���%�c�YM: ��S���"�+ P�9=+D�%�i �3� �G�vs�D ?&"� !�3nEФ��?Q��@D �Z4�]�~D �������6�	q�\.[[7����!��P�=��J��H�*]_��q�s��s��V�=w�� ��9wr��(Z����)'�IH����t�'0��y�luG�9@��UDV�W ��0ݙe)i e��.�� ����<����	�}m֛�������L ,6�  �x����~Tg����&c�U��` ���iڛu����<���?" �-��s[�!}����W�_�J���f����+^*����n�;�SSyp��c��6��e�G���;3Z�A�3�t��i�9b�Pg�����^����t����x��)O��Q�My95�G���;w9�n��$�z[������<w�#�)+��"������" U~}����O��[��|��]q;�lzt�;��Ȱ:��7�������E��*��oh�z���N<_�>���>>��|O�׷_L��/������զ9̳���{���z~����Ŀ?� �.݌��?�N����|��ZgO�o�����9��!�
Ƽ�}S߫˓���:����q�;i��i�]�t� G��Q0�_î!�w��?-��0_�|��nk�S�0l�>=]�e9�G��v��J[=Y9b�3�mE�X�X�-A��fV�2K�jS0"��2!��7��؀�3���3�\�+2�Z`��T	�hI-��N�2���A��M�@�jl����	���5�a�Y�6-o���������x}�}t��Zgs>1)���mQ?����vbZR����m���C��C�{�3o��=}b"/�|���o��?_^�_�+��,���5�U��� 4��]>	@Cl5���w��_$�c��V��sr*5 5��I��9��
�hJV�!�jk�A�=ٞ7���9<T�gť�o�٣����������l��Y�:���}�G�R}Ο����������r!Nϊ�C�;m7�dg����Ez���S%��8��)2Kͪ�6̰�5�/Ӥ�ag�1���,9Pu�]o�Q��{��;�J?<�Yo^_��~��.�>�����]����>߿Y�_�,�U_��o�~��[?n�=��Wg����>���������}y��N�m	n���Kro�䨯rJ���.u�e���-K��䐖��Y�['��N��p������r�Εܪ�x]���j1=^�wʩ4�,���!�&;ج��j�e��EcL���b�_��E�ϕ�u�$�Y��Lj��*���٢Z�y�F��m�p�
�Rw�����,Y�/q��h�M!���,V� �g��Y�J��
.��e�h#�m�d���Y�h�������k�c�q��ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dk8vqxyntmkc7"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_start_game)


func _on_start_game():
	var player = load("res://player.tscn").instantiate()
	add_child(player)
	player.position = $SpawnPoint.global_position
   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://main.gd ��������   Script    res://ui.gd ��������   PackedScene    res://map.tscn ���H�'�      local://PackedScene_hdtkk S         PackedScene          	         names "   	      main    script    Node2D    CanvasLayer    follow_viewport_enabled    Map    SpawnPoint 	   position 	   Marker2D    	   variants                                         
     �B  D      node_count             nodes     $   ��������       ����                            ����                           ���                            ����                   conn_count              conns               node_paths              editable_instances              version             RSRC      extends Node2D

@export var SPEED := 640
var speed := 0
var map_json = null

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.start_game.connect(_on_game_start)
	#generate_map_json()
	#load_map_json()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position.x -= speed * delta
	Globals.distance = round(-position.x/32)


func _on_finish_body_entered(body):
	if body is Player:
		speed = 0
		Signals.player_won.emit(round(-position.x/32))


func _on_ded_body_entered(body):
	if body is Player:
		speed = 0
		Signals.player_died.emit(round(-position.x/32))


func _on_game_start():
	position = Vector2.ZERO
	speed = SPEED


func generate_map_json():
	var tm:TileMap = $TileMap
	var bitmap:Array[PackedByteArray] = []
	
	for i in range(20):
		bitmap.append(PackedByteArray([0]))
		bitmap[i].resize(64)
	
	for tile in tm.get_used_cells(0):
		var target_y = tile[0] / 8
		var bit = 1 << (8-(tile[0] % 8 + 1))
		bitmap[tile[1]][target_y] |= bit
	
	var hexmap = []
	for i in bitmap:
		var hex = i.hex_encode()
		hexmap.append([
			hex.substr(0, 32),
			hex.substr(32, 32),
			hex.substr(64, 32),
			hex.substr(96, 32)
		])

	map_json = hexmap


func load_map_json():
	var tm:TileMap = $TileMap
	Recorder.map_data = map_json
	var hexmap = map_json
	for r in hexmap.size():
		var row = hexmap[r]
		for c in row.size():
			var chunk = row[c]
			var dec = chunk.hex_decode()
			for i in dec.size():
				var byte = dec[i]
				for k in range(8):
					var bit = 1 << (7-k)
					if byte & bit > 0:
						var coords = Vector2i((c*16+i)*8+k, r)
						tm.set_cell(0, coords, 0, Vector2i(3,3))
    RSRC                    PackedScene            ��������                                            e      resource_local_to_scene    resource_name    texture    margins    separation    texture_region_size    use_texture_padding    0:0/0 &   0:0/0/physics_layer_0/linear_velocity '   0:0/0/physics_layer_0/angular_velocity '   0:0/0/physics_layer_0/polygon_0/points    0:0/0/script    1:0/0 &   1:0/0/physics_layer_0/linear_velocity '   1:0/0/physics_layer_0/angular_velocity '   1:0/0/physics_layer_0/polygon_0/points    1:0/0/script    1:1/0 &   1:1/0/physics_layer_0/linear_velocity '   1:1/0/physics_layer_0/angular_velocity '   1:1/0/physics_layer_0/polygon_0/points    1:1/0/script    2:1/0 &   2:1/0/physics_layer_0/linear_velocity '   2:1/0/physics_layer_0/angular_velocity '   2:1/0/physics_layer_0/polygon_0/points    2:1/0/script    2:2/0 &   2:2/0/physics_layer_0/linear_velocity '   2:2/0/physics_layer_0/angular_velocity '   2:2/0/physics_layer_0/polygon_0/points    2:2/0/script    3:2/0 &   3:2/0/physics_layer_0/linear_velocity '   3:2/0/physics_layer_0/angular_velocity '   3:2/0/physics_layer_0/polygon_0/points    3:2/0/script    3:3/0 &   3:3/0/physics_layer_0/linear_velocity '   3:3/0/physics_layer_0/angular_velocity '   3:3/0/physics_layer_0/polygon_0/points    3:3/0/script    2:3/0 &   2:3/0/physics_layer_0/linear_velocity '   2:3/0/physics_layer_0/angular_velocity '   2:3/0/physics_layer_0/polygon_0/points    2:3/0/script    1:3/0 &   1:3/0/physics_layer_0/linear_velocity '   1:3/0/physics_layer_0/angular_velocity '   1:3/0/physics_layer_0/polygon_0/points    1:3/0/script    0:2/0 &   0:2/0/physics_layer_0/linear_velocity '   0:2/0/physics_layer_0/angular_velocity '   0:2/0/physics_layer_0/polygon_0/points    0:2/0/script    0:1/0 &   0:1/0/physics_layer_0/linear_velocity '   0:1/0/physics_layer_0/angular_velocity '   0:1/0/physics_layer_0/polygon_0/points    0:1/0/script    1:2/0 &   1:2/0/physics_layer_0/linear_velocity '   1:2/0/physics_layer_0/angular_velocity '   1:2/0/physics_layer_0/polygon_0/points    1:2/0/script    0:3/0 &   0:3/0/physics_layer_0/linear_velocity '   0:3/0/physics_layer_0/angular_velocity '   0:3/0/physics_layer_0/polygon_0/points    0:3/0/script    2:0/0 &   2:0/0/physics_layer_0/linear_velocity '   2:0/0/physics_layer_0/angular_velocity '   2:0/0/physics_layer_0/polygon_0/points    2:0/0/script    3:0/0 &   3:0/0/physics_layer_0/linear_velocity '   3:0/0/physics_layer_0/angular_velocity '   3:0/0/physics_layer_0/polygon_0/points    3:0/0/script    3:1/0 &   3:1/0/physics_layer_0/linear_velocity '   3:1/0/physics_layer_0/angular_velocity '   3:1/0/physics_layer_0/polygon_0/points    3:1/0/script    script    tile_shape    tile_layout    tile_offset_axis 
   tile_size    uv_clipping     physics_layer_0/collision_layer 
   sources/0    tile_proxies/source_level    tile_proxies/coords_level    tile_proxies/alternative_level    custom_solver_bias    size 	   _bundled       Script    res://map.gd ��������
   Texture2D    res://icon.svg <��Vn   !   local://TileSetAtlasSource_y1ttl �         local://TileSet_n5vqn �         local://RectangleShape2D_01fhe #         local://RectangleShape2D_pdk8i T         local://PackedScene_puowc �         TileSetAtlasSource S                  -                        
           	          
   %        ��  ��  �A  ��  �A  �A  ��  �A                   
                        %        ��  ��  �A  ��  �A  �A  ��  �A                   
                        %        ��  ��  �A  ��  �A  �A  ��  �A                   
                        %        ��  ��  �A  ��  �A  �A  ��  �A                   
                        %        ��  ��  �A  ��  �A  �A  ��  �A                 !   
           "          #   %        ��  ��  �A  ��  �A  �A  ��  �A$      %          &   
           '          (   %        ��  ��  �A  ��  �A  �A  ��  �A)      *          +   
           ,          -   %        ��  ��  �A  ��  �A  �A  ��  �A.      /          0   
           1          2   %        ��  ��  �A  ��  �A  �A  ��  �A3      4          5   
           6          7   %        ��  ��  �A  ��  �A  �A  ��  �A8      9          :   
           ;          <   %        ��  ��  �A  ��  �A  �A  ��  �A=      >          ?   
           @          A   %        ��  ��  �A  ��  �A  �A  ��  �AB      C          D   
           E          F   %        ��  ��  �A  ��  �A  �A  ��  �AG      H          I   
           J          K   %        ��  ��  �A  ��  �A  �A  ��  �AL      M          N   
           O          P   %        ��  ��  �A  ��  �A  �A  ��  �AQ      R          S   
           T          U   %        ��  ��  �A  ��  �A  �A  ��  �AV      W         TileSet    [   -           ]         ^             W         RectangleShape2D    c   
     dB �DW         RectangleShape2D    c   
    �F  jCW         PackedScene    d      	         names "         Map    script     metadata/_edit_vertical_guides_    Node2D    TileMap 	   tile_set    format    layer_0/tile_data    Finish 	   position    Area2D    CollisionShape2D    shape    Ded    _on_finish_body_entered    body_entered    _on_ded_body_entered    	   variants                           �F                   �                                                                                      	         
                                                                                                                                                        	        
                                                                                                                                                                                         !        "        #        $                                                                                	         
                                                                                                                                                                                                                !         "         #         $         %         %        &         '         (         )         *         *        +         +        ,         ,        -         -        .         .        /         /        0         0        1         1        2         2        3         3        4         4        5         5        6         6        7         7        8         8        9         9        :         :        ;         ;        <         <        =         =        >         >        ?         ?        @         @        A         A        B         B        C         C        D         D        E         E        F         F        G         G        H         H        I         I        J         J        K         K        L         L        M         M        N         N        O         O        P         P        Q         Q        R         R        S         S        T         T        U         U        V         V        W         W        X         X        Y         Y        Z         Z        [         [        \         ]         ^         _         `         a         b         c         c        d         d        e         e        f         f        g         g        h         h        i         i        j         k         l         m         n         o         o        p         p        q         q        r         r        s         s        t         t        u         u        v         w         x         y         z         {         {        |         |        }         }        ~         ~                         �         �        �         �        �         �        �         �        �         �        �         �         �         �         �         �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �         �         �         �         �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �         �         �         �         �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �         �         �         �         �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �         �         �         �         �         �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �        �         �         �         �         �         �         �         �        �         �        �         �        �         �        �         �        �         �        �         �                                                                                 	        
                                                                                                                                                                                         !        "        #        $        %        &        '        (        )        *        +        ,        -        .        /        0        1        2        3        4        5        6        7        8        9        :        ;        <        =        >        ?        @        A        B        C        D        E        F        G        H        I        J        K        L        M        N        O        P        Q        R        S        T        U        V        W        X        Y        Z        [        \        ]        ^        _        `        a        b        c        d        e        f        g        h        i        j        k        l        m        n        o        p        q        r        s        t        u        v        w        x        y        z        {        |        }        ~                �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �        �                                                                        	       
                                                                                                                                                                  !       "       (       )       *       +       ,       -       .       /       0       1       2       3       4       5       6       7       8       9       :       ;       <       =       >       ?       @       A       B       C       D       E       F       G       H       I       J       K       L       M       N       O       P       Q       R       S       T       U       V       W       ]       ^       _       `       a       b       c       d       e       f       g       h       i       j       k       l       m       n       o       p       q       r       s       t       u       v       w       x       y       z       {       |       }       ~              �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �       �
       �	       �       �       �       �       �       �       �       �       
    �F  �C
    ���  �A         
    vF  �C
    @�� ��C               node_count             nodes     @   ��������       ����                                  ����                                 
      ����   	                       ����   	                        
      ����   	                       ����   	   	      
             conn_count             conns                                                              node_paths              editable_instances              version       W      RSRCclass_name Player
extends CharacterBody2D


const JUMP_VELOCITY = -1024.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	Signals.player_died.connect(remove_player)
	Signals.player_won.connect(remove_player)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		Signals.player_jumped.emit()

	move_and_slide()


func remove_player(_distance):
	queue_free()
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    custom_solver_bias    size    script 	   _bundled       Script    res://player.gd ��������      local://RectangleShape2D_wcuvt �      #   local://PlaceholderTexture2D_oqvhf �         local://PackedScene_f25sq �         RectangleShape2D       
      B   B         PlaceholderTexture2D       
      B   B         PackedScene          	         names "         Player    script    CharacterBody2D    CollisionShape2D    shape 	   Sprite2D    texture    	   variants                                          node_count             nodes        ��������       ����                            ����                           ����                   conn_count              conns               node_paths              editable_instances              version             RSRC    extends Node

var game_tick = 0
var event_log = []
var map_data = []

enum Events {
	JUMP=1,
	GAME_OVER
}

func _ready():
	Signals.start_game.connect(_on_start_game)
	Signals.player_jumped.connect(_on_player_jump)
	Signals.player_died.connect(_on_end_game)
	Signals.player_won.connect(_on_end_game)


func _on_start_game():
	game_tick = 0
	event_log = []


func _on_end_game(distance: float):
	event_log.append(
		{
			f= game_tick,
			e= Events.GAME_OVER
		}
	)
	print_debug(event_log)


func _on_player_jump():
	event_log.append(
		{
			f= game_tick,
			e= Events.JUMP
		}
	)


func publish_game_log():

	var packed_log = PackedByteArray([0])
	packed_log.resize(event_log.size()*2)
	for i in range(0, event_log.size()):
		var event = PackedByteArray([0, 0])
		# Embed frame number in first 12 bits
		event[0] = (event_log[i].f >> 4)
		event[1] = (event_log[i].f & 31) << 4
		# Add event ID to remaining 4
		event[1] |= event_log[i].e
		print_debug(event)
		packed_log[(i)*2] = event[0]
		packed_log[(i)*2+1] = event[1]
	var log = {
		distance = Globals.distance,
		time = event_log[event_log.size()-1].f,
		events = packed_log
	}
	var payload = PackedByteArray([0, 0, 0, 0])
	payload[0] = log.distance >> 8
	payload[1] = log.distance & 255
	payload[2] = log.time >> 8
	payload[3] = log.time & 255
	payload += log.events
	
	print_debug(payload)
	print_debug(payload.hex_encode())
	JavaScriptBridge.eval("window.submitScore(" + str(payload) + ")")


func _physics_process(_delta):
	game_tick += 1
       extends Node

signal start_game
signal player_died(distance:float)
signal player_won(distance:float)
signal player_jumped
      extends CenterContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_start_pressed():
	Signals.start_game.emit()
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://start_gui.gd ��������      local://PackedScene_fav6u 
         PackedScene          	         names "      	   StartGUI    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    size_flags_horizontal    size_flags_vertical    script    CenterContainer    Start    layout_mode    text    Button    _on_start_pressed    pressed    	   variants            �?     ��     x�                            Start       node_count             nodes     (   ��������       ����                                                     	      
                              ����                         conn_count             conns                                      node_paths              editable_instances              version             RSRC            extends CanvasLayer

var hud = load("res://hud.tscn")
var start_gui = load("res://start_gui.tscn")
var game_over_gui = load("res://game_over_gui.tscn")
var active_gui:Control = null


func _ready():
	Signals.player_died.connect(_on_player_died)
	Signals.player_won.connect(_on_player_won)
	Signals.start_game.connect(_on_start_game)
	load_ui(start_gui)


func load_ui(scene:PackedScene):
	var inst = scene.instantiate()
	if active_gui != null:
		remove_child(active_gui)
		active_gui.queue_free()
		active_gui = null
	active_gui = inst
	add_child(inst)


func _on_start_game():
	load_ui(hud)


func _on_player_died(_distance):
	load_ui(game_over_gui)


func _on_player_won(_distance):
	load_ui(game_over_gui)
           [remap]

path="res://.godot/exported/133200997/export-db8b4edb8aff38bd8f0900642dcf6ca4-game_over_gui.scn"
      [remap]

path="res://.godot/exported/133200997/export-f4cf891e5f7a93b93d9b27cfb8401ccb-hud.scn"
[remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               [remap]

path="res://.godot/exported/133200997/export-e6d97c4feb736ad10c0d43b3f8310ea4-map.scn"
[remap]

path="res://.godot/exported/133200997/export-36a25e342948d0ceacc500772b5412b3-player.scn"
             [remap]

path="res://.godot/exported/133200997/export-5a389fca546c2136f90f8ffaf39b7e2d-start_gui.scn"
          list=Array[Dictionary]([{
"base": &"CharacterBody2D",
"class": &"Player",
"icon": "",
"language": &"GDScript",
"path": "res://player.gd"
}])
   <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             ���s�2�p   res://game_over_gui.tscn�f�{?A    res://hud.tscn<��Vn   res://icon.svg���r��]   res://main.tscn���H�'�   res://map.tscn��{O�*   res://player.tscnS2̖ jNc   res://start_gui.tscn  ECFG      application/config/name          runner-onchain-client      application/run/main_scene         res://main.tscn    application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg     autoload/Globals         *res://Globals.gd      autoload/Signals         *res://Signals.gd      autoload/Recorder         *res://recorder.gd     display/window/size/resizable          '   physics/common/physics_ticks_per_second         !   physics/common/physics_jitter_fix             physics/2d/default_gravity        �E#   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility    