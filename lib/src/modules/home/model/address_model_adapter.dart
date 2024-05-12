import 'package:hive/hive.dart';
import 'package:fast_location/src/modules/home/model/address_model.dart';

class AddressModelAdapter extends TypeAdapter<AddressModel> {
  @override
  final int typeId = 0;

  @override
  AddressModel read(BinaryReader reader) {
    return AddressModel(
      cep: reader.readString(),
      logradouro: reader.readString(),
      complemento: reader.readString(),
      bairro: reader.readString(),
      localidade: reader.readString(),
      uf: reader.readString(),
      ibge: reader.readString(),
      gia: reader.readString(),
      ddd: reader.readString(),
      siafi: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, AddressModel obj) {
    writer.writeString(obj.cep);
    writer.writeString(obj.logradouro);
    writer.writeString(obj.complemento);
    writer.writeString(obj.bairro);
    writer.writeString(obj.localidade);
    writer.writeString(obj.uf);
    writer.writeString(obj.ibge);
    writer.writeString(obj.gia);
    writer.writeString(obj.ddd);
    writer.writeString(obj.siafi);
  }
}