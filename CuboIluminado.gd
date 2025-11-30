extends MeshInstance3D

# Referência para a luz
@onready var spot_light = get_parent().get_node("SpotLight3D")

# Cores pré-definidas para a luz
var cores_luz = [
	Color(1, 1, 1),    # Branco
	Color(1, 0, 0),    # Vermelho
	Color(0, 1, 0),    # Verde
	Color(0, 0, 1),    # Azul
	Color(1, 1, 0),    # Amarelo
	Color(1, 0, 1),    # Magenta
	Color(0, 1, 1),    # Ciano
	Color(1, 0.5, 0)   # Laranja
]
var indice_cor = 0

# Configurações de material para testar
var config_materiais = [
	{"metallic": 0.0, "roughness": 1.0},  # Muito rugoso, não metálico
	{"metallic": 0.0, "roughness": 0.0},  # Muito liso, não metálico
	{"metallic": 1.0, "roughness": 1.0},  # Muito rugoso, muito metálico
	{"metallic": 1.0, "roughness": 0.0},  # Muito liso, muito metálico
	{"metallic": 0.5, "roughness": 0.5},  # Intermediário
	{"metallic": 0.8, "roughness": 0.2},  # Metálico e liso
	{"metallic": 0.2, "roughness": 0.8}   # Pouco metálico e rugoso
]
var indice_material = 0

func _ready():
	# Conectar o evento de clique do mouse
	get_viewport().mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	# Criar um collision shape para detectar cliques
	create_trimesh_collision()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			# Mudar cor da luz
			mudar_cor_luz()
			
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			# Mudar propriedades do material
			mudar_material()

func mudar_cor_luz():
	# Avançar para a próxima cor
	indice_cor = (indice_cor + 1) % cores_luz.size()
	spot_light.light_color = cores_luz[indice_cor]
	
	print("Cor da luz: ", cores_luz[indice_cor])
	print("Clique direito para mudar o material do cubo")

func mudar_material():
	# Avançar para a próxima configuração de material
	indice_material = (indice_material + 1) % config_materiais.size()
	var config = config_materiais[indice_material]
	
	# Aplicar ao material
	if material_override:
		material_override.metallic = config["metallic"]
		material_override.roughness = config["roughness"]
	
	print("Material - Metallic: ", config["metallic"], " Roughness: ", config["roughness"])

func _process(delta):
	# Rotação suave do cubo para melhor visualização
	rotate_y(delta * 0.5)
