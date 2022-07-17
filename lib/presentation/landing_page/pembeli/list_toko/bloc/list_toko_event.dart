class ListTokoEvent {
  ListTokoEvent();

  @override
  List<Object> get props => [];
}

class GetListTokoEvent extends ListTokoEvent{}

class ThrowErrorListTokoState extends ListTokoEvent{
  Object message;
  ThrowErrorListTokoState(this.message);
}